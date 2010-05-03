using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.ServiceModel.Activation;
using Microsoft.ServiceModel.Web;
using System.Linq;
using System.Net;
using System.Web;

// The following line sets the default namespace for DataContract serialized typed to be ""
[assembly: ContractNamespace("", ClrNamespace = "DevCampService")]

namespace DevCampService
{

    // TODO: Please set IncludeExceptionDetailInFaults to false in production environments
    [ServiceBehavior(IncludeExceptionDetailInFaults = true), AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed), ServiceContract]
    public partial class Service
    {

        [WebHelp(Comment = "AddUser")]
        [WebGet(UriTemplate = "AddUser?u={U}")]
        [OperationContract]
        public Person AddUser(string U)
        {
            DevCampDBDataContext db = new DevCampDBDataContext();
            User u = new User();
            Person p = new Person();
            try
            {
                u.Name = U;
                u.UserID = Guid.NewGuid();
                db.Users.InsertOnSubmit(u);
                db.SubmitChanges();

                p.Name = u.Name;
                p.UserID = u.UserID;
            }
            catch { }

            return p;
        }

        [WebHelp(Comment = "AddQuestion")]
        [WebGet(UriTemplate = "AddQuestion?q={Q}")]
        [OperationContract]
        public Question AddQuestion(string Q)
        {
            DevCampDBDataContext db = new DevCampDBDataContext();
            Question q = new Question();
            try
            {
                q.Name = Q;
                db.Questions.InsertOnSubmit(q);
                db.SubmitChanges();
            }
            catch { }

            return q;
        }

        [WebHelp(Comment = "GetQuestionResults")]
        [WebGet(UriTemplate = "GetQuestionResults")]
        [OperationContract]
        public List<QuestionResult> GetQuestionResults()
        {
            DevCampDBDataContext db = new DevCampDBDataContext();
            List<QuestionResult> questions = new List<QuestionResult>();
            try
            {
                questions = (from q in db.Questions
                             select new QuestionResult
                             {
                                 QuestionID = ((Int32)q.QuestionID),
                                 Name = q.Name,
                                 Sum = (q.Votes.Sum(x => x.Vote1) == null) ? 0 : (int)q.Votes.Sum(x => x.Vote1),
                                 Count = q.Votes.Count()


                                 //Average = (q.Votes.Sum(x => x.Vote1)==null)?0:((0.0+(double)q.Votes.Sum(x => x.Vote1))/(0.0+q.Votes.Count))
                             }).ToList();
            }
            catch { }
            
            return questions;
        }

        [WebHelp(Comment = "Vote")]
        [WebGet(UriTemplate = "Vote?qid={Q}&uid={U}&v={V}")]
        [OperationContract]
        public bool Vote(Int32 Q,Guid U, Int32 V)
        {
            bool result = false;
            DevCampDBDataContext db = new DevCampDBDataContext();

            try
            {
                Vote v = new Vote();
                v.QuestionID = Q;
                v.UserID = U;
                v.Vote1 = V;
                db.Votes.InsertOnSubmit(v);
                db.SubmitChanges();
                result=true;
            }
            catch { }

            return result;
        }
    }

    public class Person
    {
        public Guid UserID;
        public string Name;
    }

    public class QuestionResult
    {
        public int QuestionID;
        public string Name;
        public int Sum;
        public int Count;
    }
}