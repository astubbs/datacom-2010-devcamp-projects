﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.4927
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DevCampService
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[System.Data.Linq.Mapping.DatabaseAttribute(Name="DevCamp")]
	public partial class DevCampDBDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertVote(Vote instance);
    partial void UpdateVote(Vote instance);
    partial void DeleteVote(Vote instance);
    partial void InsertQuestion(Question instance);
    partial void UpdateQuestion(Question instance);
    partial void DeleteQuestion(Question instance);
    partial void InsertUser(User instance);
    partial void UpdateUser(User instance);
    partial void DeleteUser(User instance);
    #endregion
		
		public DevCampDBDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["DevCampConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public DevCampDBDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DevCampDBDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DevCampDBDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DevCampDBDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<Vote> Votes
		{
			get
			{
				return this.GetTable<Vote>();
			}
		}
		
		public System.Data.Linq.Table<Question> Questions
		{
			get
			{
				return this.GetTable<Question>();
			}
		}
		
		public System.Data.Linq.Table<User> Users
		{
			get
			{
				return this.GetTable<User>();
			}
		}
	}
	
	[Table(Name="dbo.Vote")]
	public partial class Vote : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private decimal _QuestionID;
		
		private System.Guid _UserID;
		
		private System.Nullable<int> _Vote1;
		
		private EntityRef<Question> _Question;
		
		private EntityRef<User> _User;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnQuestionIDChanging(decimal value);
    partial void OnQuestionIDChanged();
    partial void OnUserIDChanging(System.Guid value);
    partial void OnUserIDChanged();
    partial void OnVote1Changing(System.Nullable<int> value);
    partial void OnVote1Changed();
    #endregion
		
		public Vote()
		{
			this._Question = default(EntityRef<Question>);
			this._User = default(EntityRef<User>);
			OnCreated();
		}
		
		[Column(Storage="_QuestionID", DbType="Decimal(18,0) NOT NULL", IsPrimaryKey=true)]
		public decimal QuestionID
		{
			get
			{
				return this._QuestionID;
			}
			set
			{
				if ((this._QuestionID != value))
				{
					if (this._Question.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnQuestionIDChanging(value);
					this.SendPropertyChanging();
					this._QuestionID = value;
					this.SendPropertyChanged("QuestionID");
					this.OnQuestionIDChanged();
				}
			}
		}
		
		[Column(Storage="_UserID", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
		public System.Guid UserID
		{
			get
			{
				return this._UserID;
			}
			set
			{
				if ((this._UserID != value))
				{
					if (this._User.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnUserIDChanging(value);
					this.SendPropertyChanging();
					this._UserID = value;
					this.SendPropertyChanged("UserID");
					this.OnUserIDChanged();
				}
			}
		}
		
		[Column(Name="Vote", Storage="_Vote1", DbType="Int")]
		public System.Nullable<int> Vote1
		{
			get
			{
				return this._Vote1;
			}
			set
			{
				if ((this._Vote1 != value))
				{
					this.OnVote1Changing(value);
					this.SendPropertyChanging();
					this._Vote1 = value;
					this.SendPropertyChanged("Vote1");
					this.OnVote1Changed();
				}
			}
		}
		
		[Association(Name="Question_Vote", Storage="_Question", ThisKey="QuestionID", OtherKey="QuestionID", IsForeignKey=true)]
		public Question Question
		{
			get
			{
				return this._Question.Entity;
			}
			set
			{
				Question previousValue = this._Question.Entity;
				if (((previousValue != value) 
							|| (this._Question.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Question.Entity = null;
						previousValue.Votes.Remove(this);
					}
					this._Question.Entity = value;
					if ((value != null))
					{
						value.Votes.Add(this);
						this._QuestionID = value.QuestionID;
					}
					else
					{
						this._QuestionID = default(decimal);
					}
					this.SendPropertyChanged("Question");
				}
			}
		}
		
		[Association(Name="User_Vote", Storage="_User", ThisKey="UserID", OtherKey="UserID", IsForeignKey=true)]
		public User User
		{
			get
			{
				return this._User.Entity;
			}
			set
			{
				User previousValue = this._User.Entity;
				if (((previousValue != value) 
							|| (this._User.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._User.Entity = null;
						previousValue.Votes.Remove(this);
					}
					this._User.Entity = value;
					if ((value != null))
					{
						value.Votes.Add(this);
						this._UserID = value.UserID;
					}
					else
					{
						this._UserID = default(System.Guid);
					}
					this.SendPropertyChanged("User");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[Table(Name="dbo.Question")]
	public partial class Question : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private decimal _QuestionID;
		
		private string _Name;
		
		private EntitySet<Vote> _Votes;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnQuestionIDChanging(decimal value);
    partial void OnQuestionIDChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    #endregion
		
		public Question()
		{
			this._Votes = new EntitySet<Vote>(new Action<Vote>(this.attach_Votes), new Action<Vote>(this.detach_Votes));
			OnCreated();
		}
		
		[Column(Storage="_QuestionID", AutoSync=AutoSync.OnInsert, DbType="Decimal(18,0) NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public decimal QuestionID
		{
			get
			{
				return this._QuestionID;
			}
			set
			{
				if ((this._QuestionID != value))
				{
					this.OnQuestionIDChanging(value);
					this.SendPropertyChanging();
					this._QuestionID = value;
					this.SendPropertyChanged("QuestionID");
					this.OnQuestionIDChanged();
				}
			}
		}
		
		[Column(Storage="_Name", DbType="NVarChar(500)")]
		public string Name
		{
			get
			{
				return this._Name;
			}
			set
			{
				if ((this._Name != value))
				{
					this.OnNameChanging(value);
					this.SendPropertyChanging();
					this._Name = value;
					this.SendPropertyChanged("Name");
					this.OnNameChanged();
				}
			}
		}
		
		[Association(Name="Question_Vote", Storage="_Votes", ThisKey="QuestionID", OtherKey="QuestionID")]
		public EntitySet<Vote> Votes
		{
			get
			{
				return this._Votes;
			}
			set
			{
				this._Votes.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Votes(Vote entity)
		{
			this.SendPropertyChanging();
			entity.Question = this;
		}
		
		private void detach_Votes(Vote entity)
		{
			this.SendPropertyChanging();
			entity.Question = null;
		}
	}
	
	[Table(Name="dbo.[User]")]
	public partial class User : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private System.Guid _UserID;
		
		private string _Name;
		
		private EntitySet<Vote> _Votes;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnUserIDChanging(System.Guid value);
    partial void OnUserIDChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    #endregion
		
		public User()
		{
			this._Votes = new EntitySet<Vote>(new Action<Vote>(this.attach_Votes), new Action<Vote>(this.detach_Votes));
			OnCreated();
		}
		
		[Column(Storage="_UserID", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
		public System.Guid UserID
		{
			get
			{
				return this._UserID;
			}
			set
			{
				if ((this._UserID != value))
				{
					this.OnUserIDChanging(value);
					this.SendPropertyChanging();
					this._UserID = value;
					this.SendPropertyChanged("UserID");
					this.OnUserIDChanged();
				}
			}
		}
		
		[Column(Storage="_Name", DbType="NVarChar(128)")]
		public string Name
		{
			get
			{
				return this._Name;
			}
			set
			{
				if ((this._Name != value))
				{
					this.OnNameChanging(value);
					this.SendPropertyChanging();
					this._Name = value;
					this.SendPropertyChanged("Name");
					this.OnNameChanged();
				}
			}
		}
		
		[Association(Name="User_Vote", Storage="_Votes", ThisKey="UserID", OtherKey="UserID")]
		public EntitySet<Vote> Votes
		{
			get
			{
				return this._Votes;
			}
			set
			{
				this._Votes.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Votes(Vote entity)
		{
			this.SendPropertyChanging();
			entity.User = this;
		}
		
		private void detach_Votes(Vote entity)
		{
			this.SendPropertyChanging();
			entity.User = null;
		}
	}
}
#pragma warning restore 1591