

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us | Advocate Diary</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/contact.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/global.css">


</head>
<body>
	<section>
		<%@ include file="navbar.jsp"%>
	</section>

	<section class="page-header" style="padding-top: 150px;">
		<h1>Get in Touch</h1>
		<p>Have questions about Advocate Diary? Need help with your
			account? Our team is here to help you.</p>
	</section>

	<section class="contact-section">
		<div class="contact-container">
			<div class="contact-info">
				<h2>Contact Information</h2>
				<div class="contact-methods">
					<div class="contact-method">
						<div class="contact-icon">📞</div>
						<div class="contact-details">
							<h3>Phone Support</h3>
							<p>Our support team is available during business hours</p>
							<a href="tel:+18005551234">+1 (800) 555-1234</a>
						</div>
					</div>
					<div class="contact-method">
						<div class="contact-icon">✉️</div>
						<div class="contact-details">
							<h3>Email Us</h3>
							<p>We'll respond to your inquiry within 24 hours</p>
							<a href="mailto:support@advocatediary.com">support@advocatediary.com</a>
						</div>
					</div>
					<div class="contact-method">
						<div class="contact-icon">🏢</div>
						<div class="contact-details">
							<h3>Visit Our Office</h3>
							<p>
								123 Legal Avenue, Suite 500<br>San Francisco, CA 94105<br>United
								States
							</p>
						</div>
					</div>
				</div>
				<div class="office-hours">
					<h3>
						<span>🕘</span> Office Hours
					</h3>
					<ul class="hours-list">
						<li><span>Monday - Friday</span> <span>9:00 AM - 6:00
								PM ET</span></li>
						<li><span>Saturday</span> <span>10:00 AM - 2:00 PM ET</span>
						</li>
						<li><span>Sunday</span> <span>Closed</span></li>
					</ul>
				</div>
			</div>
			<div class="contact-form">
				<h2>Send Us a Message</h2>
				<form>
					<div class="form-group">
						<label for="name">Full Name</label> <input type="text" id="name"
							class="form-control" placeholder="Your name" required>
					</div>
					<div class="form-group">
						<label for="email">Email Address</label> <input type="email"
							id="email" class="form-control" placeholder="Your email" required>
					</div>
					<div class="form-group">
						<label for="phone">Phone Number</label> <input type="tel"
							id="phone" class="form-control" placeholder="Your phone number">
					</div>
					<div class="form-group">
						<label for="subject">Subject</label> <select id="subject"
							class="form-control" required>
							<option value="" selected disabled>Select a subject</option>
							<option value="general">General Inquiry</option>
							<option value="support">Technical Support</option>
							<option value="billing">Billing Question</option>
							<option value="sales">Sales Question</option>
							<option value="partnership">Partnership Opportunity</option>
						</select>
					</div>
					<div class="form-group">
						<label for="message">Message</label>
						<textarea id="message" class="form-control"
							placeholder="How can we help you?" required></textarea>
					</div>
					<div class="form-check">
						<input type="checkbox" id="newsletter" checked> <label
							for="newsletter">Subscribe to our newsletter to receive
							updates and special offers.</label>
					</div>
					<button type="submit" class="submit-btn">Send Message</button>
				</form>
			</div>
		</div>
	</section>

	<section class="map-section">
		<div class="map-container">
			<h2>Find Our Office</h2>
			<div class="map-frame">
				<img src="/api/placeholder/1200/400"
					alt="Map showing office location">
			</div>
		</div>
	</section>

	<section class="faq-section">
		<div class="faq-container">
			<h2>Frequently Asked Questions</h2>
			<div class="faq-item">
				<div class="faq-question">
					<span>How quickly can I expect a response to my inquiry?</span> <span>+</span>
				</div>
				<div class="faq-answer">
					<p>We strive to respond to all inquiries within 24 hours during
						business days. For urgent technical support issues, we recommend
						calling our support line directly.</p>
				</div>
			</div>
			<div class="faq-item">
				<div class="faq-question">
					<span>Do you offer on-site training for law firms?</span> <span>+</span>
				</div>
				<div class="faq-answer">
					<p>Yes, we offer on-site training for law firms with 10 or more
						users. Please contact our sales team for more information about
						our training programs and pricing.</p>
				</div>
			</div>
			<div class="faq-item">
				<div class="faq-question">
					<span>Can I schedule a demo of Advocate Diary?</span> <span>+</span>
				</div>
				<div class="faq-answer">
					<p>Absolutely! We offer personalized demos for legal
						professionals interested in learning more about Advocate Diary.
						You can schedule a demo through our website or by contacting our
						sales team.</p>
				</div>
			</div>
			<div class="faq-item">
				<div class="faq-question">
					<span>What kind of support is included with my subscription?</span>
					<span>+</span>
				</div>
				<div class="faq-answer">
					<p>All subscription plans include email and chat support. Our
						Small Firm and Enterprise plans also include priority phone
						support and dedicated onboarding assistance.</p>
				</div>
			</div>
		</div>
	</section>

	<section class="cta-section">
		<div class="cta-container">
			<h2>Ready to Get Started?</h2>
			<p>Experience how Advocate Diary can transform your legal
				practice with our 14-day free trial.</p>
			<button class="cta-button">Start Free Trial</button>
			<div class="social-links">
				<a href="#" class="social-link">f</a> <a href="#"
					class="social-link">in</a> <a href="#" class="social-link">🐦</a> <a
					href="#" class="social-link">ig</a>
			</div>
		</div>
	</section>


	<%@ include file="footer.jsp"%>
</body>
</html>


