
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.advocatediary.model.UserModel"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Advocate Diary | Legal Case Management System</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/index.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/global.css">
</head>
<body>
	<section>
		<%@ include file="navbar.jsp"%>
	</section>


	<section class="hero">
		<div class="hero-content">
			<h1>Streamline Your Legal Practice</h1>
			<p>Advocate Diary is a comprehensive case management system
				designed specifically for legal professionals. Manage cases, track
				time, organize documents, and increase productivity.</p>
			<a href="${pageContext.request.contextPath}/services" class="cta-button">Get Started</a>

		</div>
	</section>

	<section class="features" id="features">
		<div class="section-title">
			<h2>Powerful Features</h2>
			<p>Advocate Diary comes packed with all the tools you need to
				manage your legal practice efficiently</p>
		</div>
		<div class="feature-grid">
			<div class="feature-card">
				<div class="feature-icon">📅</div>
				<h3>Case Calendar</h3>
				<p>Never miss a hearing date or filing deadline with our
					intuitive calendar that syncs across all your devices.</p>
			</div>
			<div class="feature-card">
				<div class="feature-icon">📋</div>
				<h3>Case Management</h3>
				<p>Organize all case information, documents, and communications
					in one secure, accessible location.</p>
			</div>
			<div class="feature-card">
				<div class="feature-icon">⏱️</div>
				<h3>Time Tracking</h3>
				<p>Track billable hours with precision and generate detailed
					reports for clients and your practice.</p>
			</div>
			<div class="feature-card">
				<div class="feature-icon">📄</div>
				<h3>Document Assembly</h3>
				<p>Create legal documents quickly using customizable templates
					and automated form filling.</p>
			</div>
			<div class="feature-card">
				<div class="feature-icon">📊</div>
				<h3>Practice Analytics</h3>
				<p>Gain valuable insights into your practice's performance with
					detailed analytics and reporting.</p>
			</div>
			<div class="feature-card">
				<div class="feature-icon">🔒</div>
				<h3>Secure Client Portal</h3>
				<p>Share documents and communicate securely with clients through
					an encrypted client portal.</p>
			</div>
		</div>
	</section>

	<section class="testimonials" id="testimonials">
		<div class="testimonial-container">
			<div class="section-title">
				<h2>What Legal Professionals Say</h2>
				<p>Hear from attorneys and law firms who have transformed their
					practice with Advocate Diary</p>
			</div>
			<div class="testimonial-grid">
				<div class="testimonial-card">
					<div class="testimonial-text">
						<p>Advocate Diary has revolutionized how I manage my solo
							practice. The time tracking and billing features alone have saved
							me hours each week.</p>
					</div>
					<div class="testimonial-author">
						<div class="author-avatar"></div>
						<div class="author-info">
							<h4>Sarah Johnson</h4>
							<p>Family Law Attorney</p>
						</div>
					</div>
				</div>
				<div class="testimonial-card">
					<div class="testimonial-text">
						<p>Our firm switched to Advocate Diary last year, and case
							management has never been smoother. The calendar features ensure
							we never miss important dates.</p>
					</div>
					<div class="testimonial-author">
						<div class="author-avatar"></div>
						<div class="author-info">
							<h4>Michael Patel</h4>
							<p>Partner, Patel & Associates</p>
						</div>
					</div>
				</div>
				<div class="testimonial-card">
					<div class="testimonial-text">
						<p>The document assembly features save us countless hours.
							What used to take days now takes minutes, allowing us to focus on
							serving our clients better.</p>
					</div>
					<div class="testimonial-author">
						<div class="author-avatar"></div>
						<div class="author-info">
							<h4>Elizabeth Chen</h4>
							<p>Corporate Law Specialist</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="pricing" id="pricing">
		<div class="section-title">
			<h2>Simple, Transparent Pricing</h2>
			<p>Choose the plan that fits your practice size and needs</p>
		</div>
		<div class="pricing-grid">
			<div class="pricing-card">
				<h3>Solo Practice</h3>
				<div class="price">
					$49<span>/month</span>
				</div>
				<p>Perfect for individual attorneys</p>
				<ul class="pricing-features">
					<li>Unlimited Cases</li>
					<li>Calendar Management</li>
					<li>Basic Document Assembly</li>
					<li>Time Tracking</li>
					<li>Email Support</li>
				</ul>
				<button class="cta-button">Get Started</button>
			</div>
			<div class="pricing-card featured">
				<div class="featured-badge">Popular</div>
				<h3>Small Firm</h3>
				<div class="price">
					$129<span>/month</span>
				</div>
				<p>For small firms with 2-5 attorneys</p>
				<ul class="pricing-features">
					<li>Everything in Solo</li>
					<li>5 User Accounts</li>
					<li>Advanced Document Assembly</li>
					<li>Client Portal</li>
					<li>Priority Support</li>
				</ul>
				<button class="cta-button">Get Started</button>
			</div>
			<div class="pricing-card">
				<h3>Enterprise</h3>
				<div class="price">Contact Us</div>
				<p>For mid to large sized firms</p>
				<ul class="pricing-features">
					<li>Everything in Small Firm</li>
					<li>Unlimited User Accounts</li>
					<li>Custom Integrations</li>
					<li>Advanced Analytics</li>
					<li>Dedicated Support Manager</li>
				</ul>
				<button class="cta-button">Contact Sales</button>
			</div>
		</div>
	</section>

	<section class="cta" id="contact">
		<div class="cta-content">
			<h2>Ready to Transform Your Legal Practice?</h2>
			<p>Join thousands of legal professionals who have streamlined
				their practice with Advocate Diary.</p>
			<button class="cta-button">Start Your Free 14-Day Trial</button>
			<p style="margin-top: 1rem; font-size: 0.9rem;">No credit card
				required. Cancel anytime.</p>
		</div>
	</section>

	<%@ include file="footer.jsp"%>
</body>
</html>
