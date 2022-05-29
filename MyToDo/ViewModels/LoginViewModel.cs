﻿using MyToDo.Common;
using MyToDo.Common.Models;
using MyToDo.Extensions;
using MyToDo.Service;
using MyToDo.Service.GetData;
using MyToDo.Service.TestService;
using MyToDo.Shared.Dtos;
using Prism.Commands;
using Prism.Events;
using Prism.Mvvm;
using Prism.Services.Dialogs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using MyToDo.Properties;
using Prism.Ioc;

namespace MyToDo.ViewModels
{
    public class LoginViewModel : NavigationViewModel, IDialogAware
    {
        public LoginViewModel(IContainerProvider provider, IConnectService connectService, IEventAggregator aggregator) : base(provider)
        {
            ExecuteCommand = new DelegateCommand<string>(Execute);
            this.aggregator = aggregator;
            this.connectService = connectService;
        }

        private readonly IEventAggregator aggregator;
        private readonly IConnectService connectService;
        public string Title { get; set; }

        public event Action<IDialogResult> RequestClose;
        private Boolean isIndeterminatear;

        public Boolean IsIndeterminate
        {
            get { return isIndeterminatear; }
            set { isIndeterminatear = value; RaisePropertyChanged(); }
        }


        public bool CanCloseDialog()
        {
            return true;
        }

        public void OnDialogClosed()
        {
            LoginOut();
        }

        public void OnDialogOpened(IDialogParameters parameters)
        {
            
        }

        public DelegateCommand<string> ExecuteCommand { get; private set; }

        public void Execute(string arg)
        {
            switch (arg)
            {
                case "Login":
                    Login();
                    break;
                case "LoginOut":
                    LoginOut();
                    break;
                case "LoginWithout":
                    LoginWithout();
                    break;
            }
        }
        async void Login()
        {
            try
            {
                string DeviceID = Properties.Settings.Default["DeviceID"].ToString();
                IsIndeterminate = true;
                var loginResult = await connectService.Connect(new ConnectionDto()
                {
                    MouseId = DeviceID
                });
                //IsIndeterminate = false;
                if (loginResult != null && loginResult.Status == true)
                {
                    AppSession.IsConnected = true;
                    AppSession.UserName = loginResult.Result.UserName;
                    IsIndeterminate = false;
                    RequestClose?.Invoke(new DialogResult(ButtonResult.OK));
                }
                else
                {
                    AppSession.IsConnected = false;
                    AppSession.UserName = "現在是離線模式";
                    IsIndeterminate = false;
                    RequestClose?.Invoke(new DialogResult(ButtonResult.OK));
                }
            }
            catch (Exception ex)
            {
                AppSession.IsConnected = false;
                AppSession.UserName = "現在是離線模式";
                IsIndeterminate = false;
                RequestClose?.Invoke(new DialogResult(ButtonResult.OK));
            }
           
        }

        void LoginWithout()
        {
            IsIndeterminate = true;
            AppSession.IsConnected = false;
            AppSession.UserName = "現在是離線模式";
            IsIndeterminate = false;
            RequestClose?.Invoke(new DialogResult(ButtonResult.OK));
            IsIndeterminate = false;
        }
        void LoginOut()
        {
            RequestClose?.Invoke(new DialogResult(ButtonResult.No));
        }
    }
}
