using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace DevCamp
{
	public partial class QuestionControl : UserControl
	{
        public Int32 vote;
        public Int32 qID;
		public QuestionControl()
		{
			// Required to initialize variables
			InitializeComponent();
		}

        private void _Checked(object sender, RoutedEventArgs e)
        {
            vote = Int32.Parse(((RadioButton)sender).Content.ToString());
        }
	}
}