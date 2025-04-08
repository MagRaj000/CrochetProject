<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Crochet Pattern Manager</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/theme/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/theme/css/sb-admin-2.css" rel="stylesheet">
  <style>
    .custom-navbar {
      width: 100%;
      height: 50px;
      background: linear-gradient(45deg, #4e73df, #86cdf3), url('/static/images/1465324710-clipart-xl.png');
      background-repeat: no-repeat, repeat;
      background-size: cover, 50px 50px;
      background-blend-mode: overlay;
      margin: 0 auto;
    }
    .btn-save {
      background-color: #28a745;
      color: white;
    }
    .btn-save:hover {
      background-color: #218838;
    }
    .btn-show {
      background-color: #4e73df;
      color: white;
    }
    .btn-show:hover {
      background-color: #0450df;
    }
    .btn-delete {
      background-color: #a5171b;
      color: white;
    }
    .btn-delete:hover {
      background-color: #811113;
    }
    .action-links a:hover {
      text-decoration: underline;
      color: white;
    }
    .action-links {
      display: flex;
      gap: 10px;
    }
    .difficulty-stars {
      margin-left: 10px;
      color: #e8cc36;
    }
    #description {
      font-family: 'Helvetica Neue', Arial, sans-serif; /* change font to match the page style*/
      white-space: pre-wrap; /* allow text wrapping */
    }
    .step {
      cursor: pointer;
      margin: 5px 0;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    .step.completed {
      background-color: #bbddb4;
      color: gray;
    }
    .congrats-message {
      margin-top: 20px;
      padding: 10px;
      background-color: #155724;
      color: #ffffff;
      border: 1px solid #c3e6cb;
      border-radius: 5px;
      text-align: center;
    }
  </style>
</head>


<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

  <!-- Sidebar -->
  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/home">
      <div class="sidebar-brand-icon rotate-n-15">
        <i class="fas fa-laugh-wink"></i>
      </div>
      <div class="sidebar-brand-text mx-3">Crochet Manager</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
      <a class="nav-link" href="${pageContext.request.contextPath}/home">
        <i class="fas fa-fw fa-tachometer-alt"></i>
        <span>Home Page</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
      <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

  </ul>
  <!-- End of Sidebar -->

  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

      <!-- Topbar -->
<%--      <nav class="navbar navbar-expand navbar-light bg-white mb-4 static-top shadow"></nav>--%>
      <nav class="navbar navbar-expand navbar-light mb-4 static-top shadow custom-navbar"></nav>
      <!-- End of Topbar -->

      <!-- Begin Page Content -->
      <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
          <h1 class="h3 mb-0 text-gray-800">Crochet Pattern Manager</h1>
          <a href="add" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                  class="fas fa-download fa-sm text-white-50"></i>Sign in</a>
        </div>