using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Xml.Linq;
using System.IO.IsolatedStorage;

namespace DevCamp
{
    

    public partial class MainPage : UserControl
    {
        string srvStr = "http://mo.bility.co.nz/devcampservice/Service.svc/";
        //string srvStr = "http://localhost:48224/Service.svc/";
        List<Question> qs;
        Person u;
        string userXML;
        bool Answered = false;

        public MainPage()
        {
            InitializeComponent();
        }

        private int GetVote(Int32 qID) {
            int result = -1;
            foreach (object o in QuestionPanel.Children)
            {
                try
                {
                    QuestionControl qc = (QuestionControl)o;
                    if (qc.qID == qID)
                    {
                        result = qc.vote;
                    }
                }
                catch { }
            }

            return result;
        }

        private void RenderResults()
        {
            FliptoRPanel.Begin();
            FliptoRPanel.Completed += new EventHandler(FliptoRPanel_Completed);

            foreach (Question q in qs)
            {
                Vote v = new Vote();
                v.user = u;
                v.question = q;
                v.vote = GetVote(q.QuestionID);
                if (v.vote > 0)
                {
                    v.CastVote(srvStr);
                    q.Sum += v.vote;
                    q.Count++;
                }
            }
        }

        private void submitBtn_Click(object sender, RoutedEventArgs e)
        {
            IsolatedStorageSettings.ApplicationSettings["Answered"] = "true";
            Answered = true;

            RenderResults();
        }

        void FliptoRPanel_Completed(object sender, EventArgs e)
        {
            int i=1;
            foreach (Question q in qs)
            {
                TextBlock tb = new TextBlock();
                tb.FontSize = 14;
                tb.Text = i+++". "+q.Name;
                ResultsPanel.Children.Add(tb);
                TextBlock tba = new TextBlock();
                tba.FontWeight = FontWeights.Bold;
                tba.Text = "Average Score: " + q.Average.ToString("0.00");
                ResultsPanel.Children.Add(tba);
            }
        }

        private void ShowQuestions() {
            try
            {
                // set the xml absolute url to point to the same directory as the .xap file
                Uri xmlUri = new Uri(srvStr + "GetQuestionResults");

                WebClient qFeed = new WebClient();
                qFeed.DownloadStringCompleted += new DownloadStringCompletedEventHandler(qFeed_DownloadStringCompleted);
                qFeed.DownloadStringAsync(xmlUri);
                FlipToQPanel.Begin();
            }
            catch { }
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            u = new Person();
            //IsolatedStorageSettings.ApplicationSettings["User"] = "";
            //IsolatedStorageSettings.ApplicationSettings["Answered"] = "";

            Answered = ((IsolatedStorageSettings.ApplicationSettings["Answered"] != null)&&(IsolatedStorageSettings.ApplicationSettings["Answered"].ToString()!=String.Empty));
    
            if (IsolatedStorageSettings.ApplicationSettings["User"] != null)
            {
                userXML = IsolatedStorageSettings.ApplicationSettings["User"].ToString();

            }
            if (userXML != String.Empty)
            {
                setUser();
            }
            
        }

        public Button getBtn()
        {
            Button btn = new Button();
            btn.Content = "Submit Answers";
            btn.FontSize = 16;
            btn.FontWeight = FontWeights.Bold;
            btn.Cursor = Cursors.Hand;
            btn.Click += new RoutedEventHandler(submitBtn_Click);
            return btn;
        }

        void qFeed_DownloadStringCompleted(object sender, DownloadStringCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                XDocument xmlFeed = XDocument.Parse(e.Result);

                try
                {
                    qs = (from gs in xmlFeed.Descendants("QuestionResult")
                             select new Question
                             {
                                 QuestionID = Int32.Parse(gs.Element("QuestionID").Value),
                                 Name = gs.Element("Name").Value,
                                 Sum = Int32.Parse(gs.Element("Sum").Value),
                                 Count = Int32.Parse(gs.Element("Count").Value)
                                 //Average = double.Parse(gs.Element("Average").Value)
                             }).ToList();

                    if (Answered)
                    {
                        RenderResults();
                    }

                    else
                    {

                        QuestionPanel.Children.Add(getBtn());

                        int i = 1;
                        foreach (Question q in qs)
                        {
                            QuestionControl qc = new QuestionControl();
                            qc.qID = q.QuestionID;
                            qc.textBlock1.Text = i++.ToString() + ". " + q.Name;
                            QuestionPanel.Children.Add(qc);
                        }

                        QuestionPanel.Children.Add(getBtn());
                    }
                }
                catch { }
            }
        }

        private void registerBtn_Click(object sender, RoutedEventArgs e)
        {
            if (qTB.Text != String.Empty)
            {
                AddQuestion(qTB.Text);
            }
            if (nameTB.Text != String.Empty)
            {
                RegisterUser(nameTB.Text);
            }
        }

        public void AddQuestion(string Question)
        {
            Uri xmlUri = new Uri(srvStr + "AddQuestion?q=" + Question);
            WebClient aqFeed = new WebClient();
            aqFeed.DownloadStringCompleted += new DownloadStringCompletedEventHandler(aqFeed_DownloadStringCompleted);
            aqFeed.DownloadStringAsync(xmlUri);
        }

        void aqFeed_DownloadStringCompleted(object sender, DownloadStringCompletedEventArgs e)
        {
            
        }

        public void RegisterUser(string Name)
        {
            Uri xmlUri = new Uri(srvStr + "AddUser?u=" + Name);
            WebClient uFeed = new WebClient();
            uFeed.DownloadStringCompleted += new DownloadStringCompletedEventHandler(uFeed_DownloadStringCompleted);
            uFeed.DownloadStringAsync(xmlUri);
        }

        void uFeed_DownloadStringCompleted(object sender, DownloadStringCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                userXML = e.Result;
                IsolatedStorageSettings.ApplicationSettings["User"] = userXML;
                setUser();
            }
        }

        void setUser()
        {
            try
            {
                XDocument xmlFeed = XDocument.Parse(userXML);

                u = (from gs in xmlFeed.Descendants("Person")
                     select new Person
                     {
                         UserID = new Guid(gs.Element("UserID").Value),
                         Name = gs.Element("Name").Value
                     }).Single();

                ShowQuestions();
            }
            catch { }
        }
    }

    public class Person
    {
        public Guid UserID;
        public string Name;
    }

    public class Vote
    {
        public Person user;
        public Question question;
        public Int32 vote;

        public void CastVote(string srvStr)
        {
            Uri xmlUri = new Uri(srvStr + "Vote?qid="+question.QuestionID+"&uid="+user.UserID+"&v="+vote);
            WebClient vFeed = new WebClient();
            vFeed.DownloadStringCompleted += new DownloadStringCompletedEventHandler(vFeed_DownloadStringCompleted);
            vFeed.DownloadStringAsync(xmlUri);
        }

        void vFeed_DownloadStringCompleted(object sender, DownloadStringCompletedEventArgs e)
        {
        }
    }

    public class Question
    {
        public int QuestionID;
        public string Name;
        public int Sum;
        public int Count;
        public double Average
        {
            get {
                return ((double)this.Sum) / ((double)this.Count);
            }
        }
    }
}
