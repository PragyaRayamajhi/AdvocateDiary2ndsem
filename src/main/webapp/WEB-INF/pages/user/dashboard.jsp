<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    
    <!-- FontAwesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
     <style>
       :root {
            --secondary: #3498db;
            --accent: #e74c3c;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --success: #2ecc71;
            --warning: #f39c12;
            --danger: #e74c3c;
            --info: #3498db;
            --pending: #f39c12;
            --active: #2ecc71;
            --closed: #95a5a6;
            --gray: #95a5a6;
            --light-gray: #f8f9fa;
            --border: #e2e8f0;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }
        
        
        
        /* Main Content */
        .main-content {
            flex: 1;
            margin-left: 250px;
            width: calc(100% - 250px);
            transition: all 0.3s;
        }
        
        .topbar {
            background-color: white;
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 2rem;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }
        
        .toggle-sidebar {
            font-size: 1.5rem;
            cursor: pointer;
            color: var(--dark);
            display: none;
        }
        
        .search-bar {
            flex: 1;
            max-width: 500px;
            margin: 0 2rem;
            position: relative;
        }
        
        .search-bar input {
            width: 100%;
            padding: 0.5rem 1rem 0.5rem 2.5rem;
            border: 1px solid var(--border);
            border-radius: 50px;
            font-size: 0.9rem;
        }
        
        .search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
        }
        
        .user-menu {
            display: flex;
            align-items: center;
        }
        
        .notification {
            position: relative;
            margin-right: 1.5rem;
            font-size: 1.2rem;
            color: var(--dark);
            cursor: pointer;
        }
        
        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: var(--accent);
            color: white;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.7rem;
            font-weight: bold;
        }
        
        .user-profile {
            display: flex;
            align-items: center;
            cursor: pointer;
        }
        
        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--light);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: var(--dark);
            margin-right: 0.75rem;
        }
        
        .user-info {
            line-height: 1.2;
        }
        
        .user-name {
            font-weight: 600;
            font-size: 0.9rem;
        }
        
        .user-role {
            font-size: 0.75rem;
            color: var(--gray);
        }
        
        /* Dashboard Content */
        .dashboard-content {
            padding: 2rem;
        }
        
        .page-title {
            margin-bottom: 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--dark);
        }
        
        .action-buttons {
            display: flex;
            gap: 0.75rem;
        }
        
        .btn {
            padding: 0.5rem 1rem;
            border-radius: 5px;
            font-weight: 500;
            font-size: 0.9rem;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            border: none;
            transition: all 0.3s;
        }
        
        .btn-primary {
            background-color: var(--secondary);
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #2980b9;
        }
        
        .btn-outline {
            background-color: transparent;
            border: 1px solid var(--border);
        }
        
        .btn-outline:hover {
            background-color: var(--light);
        }
        
        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .stat-card {
            background-color: white;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            display: flex;
            align-items: center;
        }
        
        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-right: 1rem;
        }
        
        .active-cases .stat-icon {
            background-color: rgba(52, 152, 219, 0.1);
            color: var(--secondary);
        }
        
        .pending-hearings .stat-icon {
            background-color: rgba(243, 156, 18, 0.1);
            color: var(--warning);
        }
        
        .completed-cases .stat-icon {
            background-color: rgba(46, 204, 113, 0.1);
            color: var(--success);
        }
        
        .urgent-matters .stat-icon {
            background-color: rgba(231, 76, 60, 0.1);
            color: var(--danger);
        }
        
        .stat-info {
            flex: 1;
        }
        
        .stat-value {
            font-size: 1.75rem;
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 0.25rem;
        }
        
        .stat-label {
            font-size: 0.85rem;
            color: var(--gray);
        }
        
        .stat-change {
            font-size: 0.8rem;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }
        
        .increase {
            color: var(--success);
        }
        
        .decrease {
            color: var(--danger);
        }
        
        /* Main Table */
        .table-container {
            background-color: white;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }
        
        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }
        
        .table-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--dark);
        }
        
        .table-actions {
            display: flex;
            gap: 0.75rem;
        }
        
        .filter-dropdown {
            position: relative;
        }
        
        .filter-btn {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            border: 1px solid var(--border);
            border-radius: 5px;
            background-color: white;
            cursor: pointer;
            font-size: 0.9rem;
        }
        
        .cases-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .cases-table th {
            text-align: left;
            padding: 1rem;
            font-size: 0.85rem;
            font-weight: 600;
            color: var(--gray);
            border-bottom: 1px solid var(--border);
        }
        
        .cases-table td {
            padding: 1rem;
            border-bottom: 1px solid var(--border);
            font-size: 0.9rem;
        }
        
        .cases-table tr:last-child td {
            border-bottom: none;
        }
        
        .cases-table tr:hover {
            background-color: var(--light-gray);
        }
        
        .case-title {
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 0.25rem;
        }
        
        .case-client {
            font-size: 0.85rem;
            color: var(--gray);
        }
        
        .lawyer-name {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .lawyer-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: var(--light);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: var(--dark);
            font-size: 0.85rem;
        }
        
        .badge {
            padding: 0.25rem 0.75rem;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
            display: inline-block;
        }
        
        .badge-primary {
            background-color: rgba(52, 152, 219, 0.1);
            color: var(--secondary);
        }
        
        .badge-success {
            background-color: rgba(46, 204, 113, 0.1);
            color: var(--success);
        }
        
        .badge-warning {
            background-color: rgba(243, 156, 18, 0.1);
            color: var(--warning);
        }
        
        .badge-danger {
            background-color: rgba(231, 76, 60, 0.1);
            color: var(--danger);
        }
        
        .badge-gray {
            background-color: rgba(149, 165, 166, 0.1);
            color: var(--gray);
        }
        
        .hearing-date {
            display: flex;
            flex-direction: column;
        }
        
        .date {
            font-weight: 500;
        }
        
        .time {
            font-size: 0.8rem;
            color: var(--gray);
        }
        
        .actions {
            display: flex;
            gap: 0.5rem;
        }
        
        .action-btn {
            width: 32px;
            height: 32px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: var(--light-gray);
            color: var(--dark);
            cursor: pointer;
            border: none;
            transition: all 0.3s;
        }
        
        .action-btn:hover {
            background-color: var(--light);
        }
        
        .view-btn:hover {
            color: var(--secondary);
        }
        
        .edit-btn:hover {
            color: var(--warning);
        }
        
        .delete-btn:hover {
            color: var(--danger);
        }
        
        /* Upcoming Hearings */
        .upcoming-hearings {
            background-color: white;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        
        .hearing-list {
            list-style: none;
        }
        
        .hearing-item {
            display: flex;
            padding: 1rem 0;
            border-bottom: 1px solid var(--border);
        }
        
        .hearing-item:last-child {
            border-bottom: none;
        }
        
        .hearing-date-indicator {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 60px;
            margin-right: 1rem;
        }
        
        .date-day {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--dark);
        }
        
        .date-month {
            font-size: 0.8rem;
            color: var(--gray);
            text-transform: uppercase;
        }
        
        .hearing-details {
            flex: 1;
        }
        
        .hearing-title {
            font-weight: 600;
            margin-bottom: 0.25rem;
        }
        
        .hearing-meta {
            display: flex;
            font-size: 0.85rem;
            color: var(--gray);
            gap: 1rem;
        }
        
        .meta-item {
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }
        
        .hearing-badge {
            padding: 0.25rem 0.75rem;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
        }
        
        /* Pagination */
        .pagination {
            display: flex;
            justify-content: flex-end;
            gap: 0.25rem;
            margin-top: 1.5rem;
        }
        
        .page-item {
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9rem;
            transition: all 0.3s;
        }
        
        .page-item:hover {
            background-color: var(--light);
        }
        
        .page-item.active {
            background-color: var(--secondary);
            color: white;
        }
        
        /* Media Queries */
        @media (max-width: 992px) {
            .sidebar {
                width: 70px;
                transform: translateX(0);
            }
            
            .sidebar.expanded {
                width: 250px;
            }
            
            .logo-text, .menu-text {
                display: none;
            }
            
            .sidebar.expanded .logo-text, .sidebar.expanded .menu-text {
                display: block;
            }
            
            .menu-category {
                text-align: center;
                padding: 1rem 0 0.5rem;
            }
            
            .sidebar.expanded .menu-category {
                text-align: left;
                padding: 1rem 1.5rem 0.5rem;
            }
            
            .menu-item {
                justify-content: center;
                padding: 0.75rem;
            }
            
            .sidebar.expanded .menu-item {
                justify-content: flex-start;
                padding: 0.75rem 1.5rem;
            }
            
            .menu-icon {
                margin-right: 0;
            }
            
            .sidebar.expanded .menu-icon {
                margin-right: 10px;
            }
            
            .main-content {
                margin-left: 70px;
                width: calc(100% - 70px);
            }
            
            .sidebar.expanded + .main-content {
                margin-left: 250px;
                width: calc(100% - 250px);
            }
            
            .toggle-sidebar {
                display: block;
            }
        }
        
        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: repeat(auto-fit, minmax(100%, 1fr));
            }
            
            .main-content {
                margin-left: 0;
                width: 100%;
            }
            
            .sidebar {
                transform: translateX(-100%);
                z-index: 100;
            }
            
            .sidebar.expanded {
                transform: translateX(0);
                width: 250px;
            }
            
            .sidebar.expanded + .main-content {
                margin-left: 0;
                width: 100%;
            }
            
            .table-responsive {
                overflow-x: auto;
            }
            
            .cases-table th, .cases-table td {
                white-space: nowrap;
            }
        }
    </style>

</head>

<body>

<div class="container">

    <div class="main-content">
        <div class="topbar">
            <div class="toggle-sidebar">
                <i class="fas fa-bars"></i>
            </div>

            <div class="search-bar">
                <span class="search-icon"><i class="fas fa-search"></i></span>
                <input type="text" placeholder="Search for cases, clients, or documents...">
            </div>

            <div class="user-menu">
                <div class="notification">
                    <i class="fas fa-bell"></i>
                    <div class="notification-badge">5</div>
                </div>

                <div class="user-profile">
                    <div class="avatar">PR</div>
                    <div class="user-info">
                        <div class="user-name">Pragya Rayamajhi</div>
                        <div class="user-role">Administrator</div>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="dashboard-content">
            <div class="page-title">
                <h1 class="title">Dashboard</h1>
                <div class="action-buttons">
                    <button class="btn btn-outline">
                        <i class="fas fa-download"></i> Export
                    </button>
                    
                </div>
            </div>

            <div class="stats-grid">
                <div class="stat-card active-cases">
                    <div class="stat-icon">
                        <i class="fas fa-briefcase"></i>
                    </div>
                    <div class="stat-info">
                        <div class="stat-value">3</div>
                        <div class="stat-label">Active Cases</div>
                        <div class="stat-change increase">
                            <i class="fas fa-arrow-up"></i> 12% from last month
                        </div>
                    </div>
                </div>

                <div class="stat-card pending-hearings">
                    <div class="stat-icon">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <div class="stat-info">
                        <div class="stat-value">1</div>
                        <div class="stat-label">Pending Hearings</div>
                        <div class="stat-change increase">
                            <i class="fas fa-arrow-up"></i> 5% from last month
                        </div>
                    </div>
                </div>

                <div class="stat-card completed-cases">
                    <div class="stat-icon">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <div class="stat-info">
                        <div class="stat-value">6</div>
                        <div class="stat-label">Completed Cases</div>
                        <div class="stat-change increase">
                            <i class="fas fa-arrow-up"></i> 8% from last month
                        </div>
                    </div>
                </div>

                <div class="stat-card urgent-matters">
                    <div class="stat-icon">
                        <i class="fas fa-exclamation-circle"></i>
                    </div>
                    <div class="stat-info">
                        <div class="stat-value">0</div>
                        <div class="stat-label">Urgent Matters</div>
                        <div class="stat-change decrease">
                            <i class="fas fa-arrow-down"></i> 3% from last month
                        </div>
                    </div>
                </div>
            </div>

            <!-- Cases Table -->
            <div class="table-container">
                <div class="table-header">
                    <h2 class="table-title">Recent Cases</h2>
                    <div class="table-actions">
                        <div class="filter-dropdown">
                            <button class="filter-btn">
                                <i class="fas fa-filter"></i> Filter
                            </button>
                        </div>
                        <div class="filter-dropdown">
                            <button class="filter-btn">
                                <i class="fas fa-sort"></i> Sort
                            </button>
                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="cases-table">
                        <thead>
                            <tr>
                                <th>Case Details</th>
                                <th>Attorney</th>
                                <th>Case Type</th>
                                <th>Court</th>
                                <th>Status</th>
                                <th>Last Hearing</th>
                                <th>Next Hearing</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="case-title">Property Dispute</div>
                                    <div class="case-client">Client: Anant Raj Khadka</div>
                                </td>
                                <td>
                                    <div class="lawyer-name">
                                        <div class="lawyer-avatar">PA</div>
                                        <span>Pratiksha Adhikari</span>
                                    </div>
                                </td>
                                <td><span class="badge badge-primary">Civil Case</span></td>
                                <td>High Court,Kathmandu </td>
                                <td><span class="badge badge-warning">In Progress</span></td>
                                <td>
                                    <div class="hearing-date">
                                        <span class="date">Apr 10, 2025</span>
                                        <span class="time">10:30 AM</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="hearing-date">
                                        <span class="date">Apr 22, 2025</span>
                                        <span class="time">11:00 AM</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="actions">
                                        <button class="action-btn view-btn"><i class="fas fa-eye"></i></button>
                                        <button class="action-btn edit-btn"><i class="fas fa-edit"></i></button>
                                        <button class="action-btn delete-btn"><i class="fas fa-trash"></i></button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </div>
</div>

</body>
</html>
