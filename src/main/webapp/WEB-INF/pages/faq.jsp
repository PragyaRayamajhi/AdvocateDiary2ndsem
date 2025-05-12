<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advocate Diary - Frequently Asked Questions</title>
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
        
               
        .faq-section {
            padding: 3rem 0;
        }
        
        .section-title {
            text-align: center;
            font-size: 2rem;
            color: var(--maroon);
            margin-bottom: 2rem;
            position: relative;
        }
        
        .section-title:after {
            content: '';
            display: block;
            width: 80px;
            height: 4px;
            background-color: var(--light-maroon);
            margin: 0.5rem auto 0;
            border-radius: 2px;
        }
        
        .faq-container {
            max-width: 900px;
            margin: 0 auto;
        }
        
        .faq-item {
            margin-bottom: 1.5rem;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border-left: 4px solid var(--maroon);
            background-color: white;
        }
        
        .faq-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        
        .faq-question {
            padding: 1.2rem 1.5rem;
            cursor: pointer;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: var(--medium-grey);
            color: var(--maroon);
            transition: background-color 0.3s ease;
        }
        
        .faq-question:hover {
            background-color: #d4d4d4;
        }
        
        .faq-question::after {
            content: '+';
            font-size: 1.5rem;
            font-weight: 300;
        }
        
        .faq-answer {
            padding: 0;
            max-height: 0;
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .faq-answer-content {
            padding: 0 1.5rem 1.5rem;
        }
        
        .faq-item.active .faq-question::after {
            content: '−';
        }
        
        .faq-item.active .faq-answer {
            max-height: 500px;
            padding: 1rem 0 0;
        }
        
        .faq-categories {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 2rem;
        }
        
        .category-btn {
            padding: 0.6rem 1.2rem;
            background-color: white;
            border: 2px solid var(--maroon);
            color: var(--maroon);
            border-radius: 30px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .category-btn:hover, .category-btn.active {
            background-color: var(--maroon);
            color: white;
        }
        
        .search-container {
            margin-bottom: 2rem;
            text-align: center;
        }
        
        .search-box {
            padding: 1rem;
            width: 100%;
            max-width: 500px;
            border: 2px solid #ddd;
            border-radius: 30px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .search-box:focus {
            outline: none;
            border-color: var(--maroon);
            box-shadow: 0 0 5px rgba(128, 0, 32, 0.3);
        }
        
        .still-have-questions {
            text-align: center;
            background-color: var(--maroon);
            color: white;
            padding: 3rem 0;
            margin-top: 3rem;
        }
        
        .contact-btn {
            display: inline-block;
            margin-top: 1.5rem;
            padding: 0.8rem 2rem;
            background-color: white;
            color: var(--maroon);
            border: none;
            border-radius: 30px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .contact-btn:hover {
            background-color: var(--light-grey);
            transform: translateY(-3px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        
            </style>
</head>
<body>
<%@ include file="navbar.jsp"%>
   
    <section class="faq-section" style="padding-top: 150px;">
        <div class="container">
            <h2 class="section-title">Frequently Asked Questions</h2>
            
            <div class="search-container">
                <input type="text" class="search-box" placeholder="Search for questions...">
            </div>
            
            <div class="faq-categories">
                <button class="category-btn active">All</button>
                <button class="category-btn">Getting Started</button>
                <button class="category-btn">Case Management</button>
                <button class="category-btn">Billing & Payments</button>
                <button class="category-btn">Security</button>
                <button class="category-btn">Technical</button>
            </div>
            
            <div class="faq-container">
                <!-- Getting Started Questions -->
                <div class="faq-item">
                    <div class="faq-question">What is Advocate Diary?</div>
                    <div class="faq-answer">
                        <div class="faq-answer-content">
                            Advocate Diary is a comprehensive legal case management system designed specifically for legal professionals. It streamlines your daily workflow by organizing cases, tracking deadlines, managing client information, generating documents, and handling billing in one secure platform. Our system helps you focus more on legal work and less on administrative tasks.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">How do I sign up for Advocate Diary?</div>
                    <div class="faq-answer">
                        <div class="faq-answer-content">
                            Signing up is simple. Visit our website and click the "Sign Up" button in the top right corner. Fill out the registration form with your details and select your subscription plan. You'll receive a confirmation email with login instructions. If you need help during setup, our customer support team is available via live chat or email.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">Is there a free trial available?</div>
                    <div class="faq-answer">
                        <div class="faq-answer-content">
                            Yes! We offer a 14-day free trial with full access to all features. No credit card is required to start your trial. This gives you ample time to explore the system and determine if it meets your needs. At the end of your trial, you can choose the subscription plan that works best for your practice.
                        </div>
                    </div>
                </div>
                
                <!-- Case Management Questions -->
                <div class="faq-item">
                    <div class="faq-question">How can I add a new case to the system?</div>
                    <div class="faq-answer">
                        <div class="faq-answer-content">
                            To add a new case, log in to your dashboard and click on "Cases" in the main navigation menu. Click the "+ New Case" button. Fill in the required case details including client information, case type, court details, opposing parties, and any relevant notes. You can also upload related documents at this stage. Once saved, the case will appear in your case dashboard for easy access.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">Can I set reminders for important case deadlines?</div>
                    <div class="faq-answer">
                        <div class="faq-answer-content">
                            Absolutely! Advocate Diary has a robust calendar and reminder system. When viewing a case, click on the "Calendar" tab and select "+ Add Event" to create a new deadline or appointment. You can set multiple reminders (email, SMS, or in-app notifications) and even assign tasks to team members. All deadlines automatically sync with your integrated calendar applications.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">How do I track time spent on different cases?</div>
                    <div class="faq-answer">
                        <div class="faq-answer-content">
                            Time tracking is easy with Advocate Diary. You can use the built-in timer by clicking the "Start Timer" button when working on a case, or manually add time entries later. Navigate to the specific case, select the "Time & Billing" tab, and click "+ Add Time Entry." Enter the date, duration, description of work performed, and applicable billing rate. The system automatically calculates the billable amount based on your rate settings.
                        </div>
                    </div>
                </div>
                
                <!-- Billing & Payments Questions -->
                <div class="faq-item">
                    <div class="faq-question">How does the billing system work?</div>
                    <div class="faq-answer">
                        <div class="faq-answer-content">
                            Our billing system integrates directly with your case management. From the "Billing" section, you can generate invoices based on recorded time entries and expenses. The system allows you to customize invoice templates, apply different rates for different types of work, add discounts or taxes, and track payment status. You can also set up recurring billing for retainer clients and send automated payment reminders.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">Can clients pay their invoices online?</div>
                    <div class="faq-answer">
                        <div class="faq-answer-content">
                            Yes, Advocate Diary offers secure online payment options. When you send an invoice to a client, they receive a link to a secure client portal where they can view and pay their invoice using credit cards, debit cards, or bank transfers. The system integrates with popular payment processors including Stripe and PayPal. Once payment is received, the invoice is automatically marked as paid in your system.
                        </div>
                    </div>
                </div>
                
                <!-- Security Questions -->
                <div class="faq-item">
                    <div class="faq-question">How secure is my data in Advocate Diary?</div>
                    <div class="faq-answer">
                        <div class="faq-answer-content">
                            Security is our top priority. Advocate Diary uses bank-level 256-bit encryption for all data, both in transit and at rest. We employ multi-factor authentication, regular security audits, and automated threat detection. Our servers are hosted in SOC 2 compliant data centers with redundant backups. We adhere to legal industry security standards and privacy regulations to ensure your sensitive client information remains protected.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">Can I control who has access to specific case information?</div>
                    <div class="faq-answer">
                        <div class="faq-answer-content">
                            Yes, Advocate Diary offers granular permission settings. As an administrator, you can create user roles with specific access privileges (view-only, edit, admin) and assign them to team members. You can restrict access to sensitive cases, financial information, or specific document categories. The system maintains a detailed audit log of all user actions for accountability and compliance purposes.
                        </div>
                    </div>
                </div>
                
                <!-- Technical Questions -->
                <div class="faq-item">
                    <div class="faq-question">Is Advocate Diary compatible with my existing tools?</div>
                    <div class="faq-answer">
                        <div class="faq-answer-content">
                            Advocate Diary integrates with many popular legal and productivity tools. This includes Microsoft Office 365, Google Workspace, Outlook, popular accounting software (QuickBooks, Xero), e-filing systems, and e-signature services like DocuSign. We also offer an API for custom integrations. If you have specific software you need to connect with, contact our support team to discuss integration options.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">Can I access Advocate Diary on mobile devices?</div>
                    <div class="faq-answer">
                        <div class="faq-answer-content">
                            Absolutely! Advocate Diary is fully responsive and works on any device with a web browser. We also offer dedicated mobile apps for iOS and Android devices. The mobile versions allow you to access case information, track time, view calendars, and receive notifications while on the go. All changes sync automatically across all your devices.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">What happens if I need help using the system?</div>
                    <div class="faq-answer">
                        <div class="faq-answer-content">
                            We provide multiple support options. Within the application, you'll find an extensive knowledge base with tutorials and guides. Our live chat support is available during business hours, and email support is available 24/7. Premium subscribers also get access to phone support and personalized onboarding sessions. We regularly host free webinars on system features and best practices for maximizing your efficiency.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="still-have-questions">
        <div class="container">
            <h2>Still Have Questions?</h2>
            <p>Our support team is ready to help you with any inquiries about Advocate Diary.</p>
            <a href="#" class="contact-btn">Contact Support</a>
        </div>
    </section>

     <script>
        // Toggle FAQ answers
        document.querySelectorAll('.faq-question').forEach(question => {
            question.addEventListener('click', () => {
                const item = question.parentNode;
                item.classList.toggle('active');
            });
        });
        
        // Search functionality
        const searchBox = document.querySelector('.search-box');
        const faqItems = document.querySelectorAll('.faq-item');
        
        searchBox.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            
            faqItems.forEach(item => {
                const question = item.querySelector('.faq-question').textContent.toLowerCase();
                const answer = item.querySelector('.faq-answer-content').textContent.toLowerCase();
                
                if (question.includes(searchTerm) || answer.includes(searchTerm)) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        });
        
        // Category filter functionality
        const categoryButtons = document.querySelectorAll('.category-btn');
        
        categoryButtons.forEach(button => {
            button.addEventListener('click', function() {
                // Remove active class from all buttons
                categoryButtons.forEach(btn => btn.classList.remove('active'));
                
                // Add active class to clicked button
                this.classList.add('active');
                
                // For demonstration purposes - in a real implementation, 
                // this would filter the FAQs based on categories
                // This is just showing the button state change
            });
        });
    </script>
    <%@ include file="footer.jsp"%>
</body>
</html>