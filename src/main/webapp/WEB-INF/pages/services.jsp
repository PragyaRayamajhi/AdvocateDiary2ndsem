<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advocate Diary - Our Services</title>
     <style>
        :root {
            --maroon: #800020;
            --light-maroon: #a52a2a;
            --light-grey: #f5f5f5;
            --medium-grey: #e0e0e0;
            --dark-grey: #666;
            --text-color: #333;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: var(--light-grey);
            color: var(--text-color);
            line-height: 1.6;
        }
       
        .section {
            padding: 5rem 0;
        }
        
        .section-title {
            text-align: center;
            font-size: 2.2rem;
            color: var(--maroon);
            margin-bottom: 1rem;
        }
        
        .section-subtitle {
            text-align: center;
            font-size: 1.1rem;
            color: var(--dark-grey);
            max-width: 800px;
            margin: 0 auto 3rem;
        }
        
        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }
        
        .service-card {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        
        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 20px rgba(0, 0, 0, 0.1);
        }
        
        .service-img {
            height: 200px;
            background-color: var(--medium-grey);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .service-img img {
            max-width: 80px;
            opacity: 0.7;
        }
        
        .service-content {
            padding: 1.5rem;
        }
        
        .service-title {
            font-size: 1.4rem;
            color: var(--maroon);
            margin-bottom: 1rem;
        }
        
        .service-text {
            color: var(--dark-grey);
            margin-bottom: 1.5rem;
        }
        
        .workflow {
            background-color: white;
            padding: 5rem 0;
        }
        
        .workflow-container {
            max-width: 900px;
            margin: 0 auto;
        }
        
        .workflow-steps {
            margin-top: 4rem;
            position: relative;
        }
        
        .workflow-steps:before {
            content: '';
            position: absolute;
            top: 0;
            bottom: 0;
            left: 50%;
            width: 4px;
            background-color: var(--maroon);
            transform: translateX(-50%);
        }
        
        .workflow-step {
            display: flex;
            justify-content: flex-start;
            margin-bottom: 3rem;
            position: relative;
        }
        
        .workflow-step:nth-child(even) {
            flex-direction: row-reverse;
        }
        
        .workflow-icon {
            min-width: 120px;
            height: 120px;
            background-color: var(--maroon);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2.5rem;
            font-weight: bold;
            z-index: 2;
            box-shadow: 0 5px 15px rgba(128, 0, 32, 0.3);
        }
        
        .workflow-content {
            background-color: var(--light-grey);
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            width: calc(100% - 150px);
            position: relative;
            margin: 0 2rem;
        }
        
        .workflow-step:nth-child(odd) .workflow-content:before {
            content: '';
            position: absolute;
            left: -15px;
            top: 50%;
            transform: translateY(-50%);
            border-width: 15px 15px 15px 0;
            border-style: solid;
            border-color: transparent var(--light-grey) transparent transparent;
        }
        
        .workflow-step:nth-child(even) .workflow-content:before {
            content: '';
            position: absolute;
            right: -15px;
            top: 50%;
            transform: translateY(-50%);
            border-width: 15px 0 15px 15px;
            border-style: solid;
            border-color: transparent transparent transparent var(--light-grey);
        }
        
        .workflow-title {
            font-size: 1.4rem;
            color: var(--maroon);
            margin-bottom: 1rem;
        }
        
        .features {
            background-color: var(--light-grey);
            padding: 5rem 0;
        }
        
        .features-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }
        
        .feature-item {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: all 0.3s ease;
        }
        
        .feature-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }
        
        .feature-icon {
            width: 70px;
            height: 70px;
            background-color: var(--maroon);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.8rem;
            margin: 0 auto 1.5rem;
        }
        
        .feature-title {
            font-size: 1.3rem;
            color: var(--maroon);
            margin-bottom: 1rem;
        }
        
        footer {
            background-color: var(--maroon);
            color: white;
            padding: 3rem 0 1rem;
        }
        
        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }
        
        .footer-column h3 {
            font-size: 1.2rem;
            margin-bottom: 1.5rem;
            position: relative;
        }
        
        .footer-column h3:after {
            content: '';
            display: block;
            width: 50px;
            height: 2px;
            background-color: white;
            margin-top: 0.5rem;
            opacity: 0.5;
        }
        
        .footer-links {
            list-style: none;
        }
        
        .footer-links li {
            margin-bottom: 0.8rem;
        }
        
        .footer-links a {
            color: white;
            text-decoration: none;
            opacity: 0.8;
            transition: all 0.3s ease;
        }
        
        .footer-links a:hover {
            opacity: 1;
            padding-left: 5px;
        }
        
        .copyright {
            text-align: center;
            padding-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            font-size: 0.9rem;
            opacity: 0.8;
        }
        
        @media (max-width: 992px) {
            .workflow-steps:before {
                left: 60px;
            }
            
            .workflow-step, 
            .workflow-step:nth-child(even) {
                flex-direction: row;
            }
            
            .workflow-icon {
                min-width: 100px;
                height: 100px;
                font-size: 2rem;
                margin-left: 10px;
            }
            
            .workflow-content {
                width: calc(100% - 130px);
                margin-left: 30px;
            }
            
            .workflow-step:nth-child(even) .workflow-content:before {
                right: auto;
                left: -15px;
                border-width: 15px 15px 15px 0;
                border-color: transparent var(--light-grey) transparent transparent;
            }
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 0 1rem;
            }
            
            .logo {
                font-size: 2rem;
            }
            
            .tagline {
                font-size: 1rem;
            }
            
            .section-title {
                font-size: 1.8rem;
            }
            
            .workflow-icon {
                min-width: 80px;
                height: 80px;
                font-size: 1.5rem;
            }
            
            .workflow-content {
                padding: 1.5rem;
            }
            
            .workflow-title {
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp"%>
 

    <section class="section" style="padding-top: 150px;">
        <div class="container">
            <h2 class="section-title">Core Services</h2>
            <p class="section-subtitle">Discover how our legal case management system revolutionizes the way law firms operate, with powerful tools for administrators and attorneys.</p>
            
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-img">
                        <img src="/api/placeholder/80/80" alt="Case Assignment">
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Smart Case Assignment</h3>
                        <p class="service-text">Admin lawyers can efficiently assign cases to team members based on expertise, workload, and availability. Include comprehensive case details, court information, and deadlines in one streamlined process.</p>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-img">
                        <img src="/api/placeholder/80/80" alt="Case Management">
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Comprehensive Case Management</h3>
                        <p class="service-text">Track all case developments, court dates, client communications, and documents in one centralized location. User lawyers can view their assigned cases with full details and update case progress in real-time.</p>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-img">
                        <img src="/api/placeholder/80/80" alt="Document Management">
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Document Management</h3>
                        <p class="service-text">Create, store, and share legal documents securely. Our system includes templates for common legal documents, version control, and collaborative editing features for team members working on the same case.</p>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-img">
                        <img src="/api/placeholder/80/80" alt="Time Tracking">
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Time & Billing</h3>
                        <p class="service-text">Accurately track time spent on each case with our built-in timer. Generate detailed invoices, track payments, and monitor billable hours for individual lawyers and the entire firm at a glance.</p>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-img">
                        <img src="/api/placeholder/80/80" alt="Calendar Management">
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Calendar & Deadline Management</h3>
                        <p class="service-text">Never miss an important date with our court calendar system. Set reminders for hearings, filing deadlines, and client meetings. Seamlessly syncs with popular calendar applications.</p>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-img">
                        <img src="/api/placeholder/80/80" alt="Client Portal">
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Client Portal</h3>
                        <p class="service-text">Provide clients with secure access to case information, documents, and billing details. Improve client satisfaction with transparent communication and easy document sharing.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="workflow">
        <div class="container">
            <h2 class="section-title">How It Works</h2>
            <p class="section-subtitle">Our streamlined workflow ensures smooth case management from assignment to resolution</p>
            
            <div class="workflow-container">
                <div class="workflow-steps">
                    <div class="workflow-step">
                        <div class="workflow-icon">1</div>
                        <div class="workflow-content">
                            <h3 class="workflow-title">Case Registration</h3>
                            <p>Admin lawyer inputs new case details into the system including client information, case type, court details, opposing counsel, and relevant documentation.</p>
                        </div>
                    </div>
                    
                    <div class="workflow-step">
                        <div class="workflow-icon">2</div>
                        <div class="workflow-content">
                            <h3 class="workflow-title">Attorney Assignment</h3>
                            <p>Admin assigns the case to the most appropriate lawyer based on expertise, current workload, and availability. The system provides suggestions based on lawyer profiles and current caseloads.</p>
                        </div>
                    </div>
                    
                    <div class="workflow-step">
                        <div class="workflow-icon">3</div>
                        <div class="workflow-content">
                            <h3 class="workflow-title">Case Acceptance</h3>
                            <p>Assigned lawyer receives notification with complete case details and access to all documents. They can review and accept the case, or request reassignment if necessary.</p>
                        </div>
                    </div>
                    
                    <div class="workflow-step">
                        <div class="workflow-icon">4</div>
                        <div class="workflow-content">
                            <h3 class="workflow-title">Case Management</h3>
                            <p>Lawyer manages the case through our intuitive interface - tracking deadlines, logging time, adding notes, and uploading relevant documents as the case progresses.</p>
                        </div>
                    </div>
                    
                    <div class="workflow-step">
                        <div class="workflow-icon">5</div>
                        <div class="workflow-content">
                            <h3 class="workflow-title">Progress Reporting</h3>
                            <p>Both admin and assigned lawyers can view real-time updates on case progress, upcoming deadlines, and billable hours. Regular automated reports keep everyone informed.</p>
                        </div>
                    </div>
                    
                    <div class="workflow-step">
                        <div class="workflow-icon">6</div>
                        <div class="workflow-content">
                            <h3 class="workflow-title">Case Resolution</h3>
                            <p>Upon case completion, all details are archived for future reference while maintaining accessibility. Outcome analysis helps improve future case handling.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="features">
        <div class="container">
            <h2 class="section-title">Key Features</h2>
            <p class="section-subtitle">Designed with both admin and user lawyers in mind</p>
            
            <div class="features-container">
                <div class="feature-item">
                    <div class="feature-icon">🔒</div>
                    <h3 class="feature-title">Role-Based Access Control</h3>
                    <p>Admin lawyers control permissions while user lawyers access only their assigned cases and documents.</p>
                </div>
                
                <div class="feature-item">
                    <div class="feature-icon">📊</div>
                    <h3 class="feature-title">Performance Analytics</h3>
                    <p>Track case outcomes, billable hours, and lawyer performance with customizable reports and dashboards.</p>
                </div>
                
                <div class="feature-item">
                    <div class="feature-icon">🔍</div>
                    <h3 class="feature-title">Advanced Search</h3>
                    <p>Quickly find cases, documents, and communications with our powerful full-text search capabilities.</p>
                </div>
                
                <div class="feature-item">
                    <div class="feature-icon">🔔</div>
                    <h3 class="feature-title">Smart Notifications</h3>
                    <p>Receive alerts for upcoming deadlines, new case assignments, and important updates.</p>
                </div>
                
                <div class="feature-item">
                    <div class="feature-icon">📱</div>
                    <h3 class="feature-title">Mobile Access</h3>
                    <p>Access your cases from anywhere with our mobile-responsive design and dedicated applications.</p>
                </div>
                
                <div class="feature-item">
                    <div class="feature-icon">🔄</div>
                    <h3 class="feature-title">Seamless Integrations</h3>
                    <p>Connect with your existing tools including email, calendar, accounting, and document management systems.</p>
                </div>
            </div>
        </div>
    </section>



    <script>
        // Basic interactivity for expanding FAQ items
        document.addEventListener('DOMContentLoaded', function() {
            // Make workflow steps interactive
            const workflowSteps = document.querySelectorAll('.workflow-step');
            
            workflowSteps.forEach(step => {
                step.addEventListener('mouseenter', function() {
                    this.style.transform = 'scale(1.03)';
                    this.style.transition = 'all 0.3s ease';
                });
                
                step.addEventListener('mouseleave', function() {
                    this.style.transform = 'scale(1)';
                });
            });
            
            // Make service cards interactive
            const serviceCards = document.querySelectorAll('.service-card');
            
            serviceCards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    // Removed code for learn more button
                });
                
                card.addEventListener('mouseleave', function() {
                    // Removed code for learn more button
                });
            });
        });
    </script>
    <%@ include file="footer.jsp"%>
</body>
</html>