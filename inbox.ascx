﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="inbox.ascx.cs" Inherits="components_inbox" %>


    <link rel='stylesheet' href='/css/stylepro.css'>

<div class="email-app mb-4">
    <nav><a class="btn btn-danger btn-block" href="page-inbox-compose.html">New Email</a><ul class="nav">
        <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-inbox"></i>Inbox <span class="badge badge-danger">4</span></a></li>
        <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-star"></i>Stared</a></li>
        <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-rocket"></i>Sent</a></li>
        <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-trash-o"></i>Trash</a></li>
        <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-bookmark"></i>Important<span class="badge badge-info">5</span></a></li>
        <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-inbox"></i>Inbox <span class="badge badge-danger">4</span></a></li>
    </ul>
    </nav>
    <main class="inbox">
        <div class="toolbar">
            <div class="btn-group">
                <button class="btn btn-light" type="button"><span class="fa fa-envelope"></span></button>
                <button class="btn btn-light" type="button"><span class="fa fa-star"></span></button>
                <button class="btn btn-light" type="button"><span class="fa fa-star-o"></span></button>
                <button class="btn btn-light" type="button"><span class="fa fa-bookmark-o"></span></button>
            </div>
            <div class="btn-group">
                <button class="btn btn-light" type="button"><span class="fa fa-mail-reply"></span></button>
                <button class="btn btn-light" type="button"><span class="fa fa-mail-reply-all"></span></button>
                <button class="btn btn-light" type="button"><span class="fa fa-mail-forward"></span></button>
            </div>
            <button class="btn btn-light" type="button"><span class="fa fa-trash-o"></span></button>
            <div class="btn-group" dropdown="" placement="bottom right">
                <button aria-haspopup="true" class="btn btn-light dropdown-toggle" data-toggle="dropdown" dropdowntoggle="" href="#" role="button" type="button"><span class="fa fa-tags"></span><span class="caret"></span></button>
                <!---->
            </div>
            <div class="btn-group float-right">
                <button class="btn btn-light" type="button"><span class="fa fa-chevron-left"></span></button>
                <button class="btn btn-light" type="button"><span class="fa fa-chevron-right"></span></button>
            </div>
        </div>
        <ul class="messages">
            <li class="message unread"><a href="#">
                <div class="actions"><span class="action"><i class="fa fa-square-o"></i></span><span class="action"><i class="fa fa-star-o"></i></span></div>
                <div class="header"><span class="from">Lukasz Holeczek</span><span class="date"><span class="fa fa-paper-clip"></span> Today, 3:47 PM</span></div>
                <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing elit. </div>
                <div class="description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </div>
            </a></li>
            <li class="message"><a href="#">
                <div class="actions"><span class="action"><i class="fa fa-square-o"></i></span><span class="action"><i class="fa fa-star-o"></i></span></div>
                <div class="header"><span class="from">Lukasz Holeczek</span><span class="date"><span class="fa fa-paper-clip"></span> Today, 3:47 PM</span></div>
                <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </div>
                <div class="description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </div>
            </a></li>
            <li class="message"><a href="#">
                <div class="actions"><span class="action"><i class="fa fa-square-o"></i></span><span class="action"><i class="fa fa-star-o"></i></span></div>
                <div class="header"><span class="from">Lukasz Holeczek</span><span class="date">Today, 3:47 PM</span></div>
                <div class="title">Lorem ipsum dolor sit amet. </div>
                <div class="description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </div>
            </a></li>
            <li class="message unread"><a href="#">
                <div class="actions"><span class="action"><i class="fa fa-square-o"></i></span><span class="action"><i class="fa fa-star-o"></i></span></div>
                <div class="header"><span class="from">Lukasz Holeczek</span><span class="date">Today, 3:47 PM</span></div>
                <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing elit. </div>
                <div class="description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </div>
            </a></li>
            <li class="message"><a href="#">
                <div class="actions"><span class="action"><i class="fa fa-square-o"></i></span><span class="action"><i class="fa fa-star-o"></i></span></div>
                <div class="header"><span class="from">Lukasz Holeczek</span><span class="date">Today, 3:47 PM</span></div>
                <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </div>
                <div class="description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </div>
            </a></li>
            <li class="message"><a href="#">
                <div class="actions"><span class="action"><i class="fa fa-square-o"></i></span><span class="action"><i class="fa fa-star-o"></i></span></div>
                <div class="header"><span class="from">Lukasz Holeczek</span><span class="date">Today, 3:47 PM</span></div>
                <div class="title">Lorem ipsum dolor sit amet. </div>
                <div class="description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </div>
            </a></li>
            <li class="message unread"><a href="#">
                <div class="actions"><span class="action"><i class="fa fa-square-o"></i></span><span class="action"><i class="fa fa-star-o"></i></span></div>
                <div class="header"><span class="from">Lukasz Holeczek</span><span class="date">Today, 3:47 PM</span></div>
                <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing elit. </div>
                <div class="description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </div>
            </a></li>
            <li class="message"><a href="#">
                <div class="actions"><span class="action"><i class="fa fa-square-o"></i></span><span class="action"><i class="fa fa-star-o"></i></span></div>
                <div class="header"><span class="from">Lukasz Holeczek</span><span class="date">Today, 3:47 PM</span></div>
                <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </div>
                <div class="description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </div>
            </a></li>
            <li class="message"><a href="#">
                <div class="actions"><span class="action"><i class="fa fa-square-o"></i></span><span class="action"><i class="fa fa-star-o"></i></span></div>
                <div class="header"><span class="from">Lukasz Holeczek</span><span class="date">Today, 3:47 PM</span></div>
                <div class="title">Lorem ipsum dolor sit amet. </div>
                <div class="description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </div>
            </a></li>
        </ul>
    </main></div>
