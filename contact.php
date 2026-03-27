<?php
include 'includes/header.php';

// Initialize variables
$message = '';
$error = '';
$name = $email = $phone = $subject = $form_message = "";

// Form submission handling
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and retrieve form data
    $name = trim(htmlspecialchars($_POST['name']));
    $email = trim(htmlspecialchars($_POST['email']));
    $phone = trim(htmlspecialchars($_POST['phone']));
    $subject = trim(htmlspecialchars($_POST['subject']));
    $form_message = trim(htmlspecialchars($_POST['message']));

    // Basic validation
    if (empty($name) || empty($email) || empty($phone) || empty($form_message)) {
        $error = "Please fill in all required fields.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Invalid email format.";
    } else {
        // Prepare SQL statement to prevent SQL injection
        $stmt = $conn->prepare("INSERT INTO contact_messages (name, email, phone, subject, message) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $name, $email, $phone, $subject, $form_message);

        if ($stmt->execute()) {
            $message = "Thank you! Your message has been sent successfully.";
            // Clear form fields after success
            $name = $email = $phone = $subject = $form_message = "";
        } else {
            $error = "Sorry, something went wrong. Please try again later.";
        }
        $stmt->close();
    }
}
?>



<!-- Main Contact Page Section -->
<section class="contact-page">
    <div class="container">
        <div class="contact-wrapper">

            <!-- Left Column: Contact Info & Map -->
            <div class="contact-info">
                <h3>Our Contact Details</h3>
                <p>We are here to help. Reach out to us through any of the following channels.</p>
                <ul>
                    <li><i class="fas fa-map-marker-alt"></i> <strong>Address:</strong><br> Sandipani Vidyalaya, Bahoriband, Katni, Madhya Pradesh, India</li>
                    <li><i class="fas fa-phone"></i> <strong>Phone:</strong><br> +91-12345-67890, +91-98765-43210</li>
                    <li><i class="fas fa-envelope"></i> <strong>Email:</strong><br> info@sandipanividyalaya.com</li>
                </ul>
                <div class="map-container">
                    <!-- PASTE YOUR GOOGLE MAPS EMBED CODE HERE -->
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d117502.77121731388!2d80.0163250162095!3d23.64293931631584!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39825b6823381a1d%3A0x593a14038313460d!2sBahoriband%2C%20Madhya%20Pradesh%20483330!5e0!3m2!1sen!2sin!4v1672233445566!5m2!1sen!2sin" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>

            <!-- Right Column: Contact Form -->
            <div class="contact-form">
                <h3>Send Us a Message</h3>
                
                <!-- Display Success/Error Messages -->
                <?php if (!empty($message)): ?>
                    <div class="alert success"><?php echo $message; ?></div>
                <?php endif; ?>
                <?php if (!empty($error)): ?>
                    <div class="alert error"><?php echo $error; ?></div>
                <?php endif; ?>

                <form id="contactForm" action="contact.php" method="POST">
                    <div class="form-group">
                        <label for="name">Full Name <span class="required">*</span></label>
                        <input type="text" id="name" name="name" value="<?php echo htmlspecialchars($name); ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address <span class="required">*</span></label>
                        <input type="email" id="email" name="email" value="<?php echo htmlspecialchars($email); ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone Number <span class="required">*</span></label>
                        <input type="tel" id="phone" name="phone" value="<?php echo htmlspecialchars($phone); ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <input type="text" id="subject" name="subject" value="<?php echo htmlspecialchars($subject); ?>">
                    </div>
                    <div class="form-group">
                        <label for="message">Message <span class="required">*</span></label>
                        <textarea id="message" name="message" rows="6" required><?php echo htmlspecialchars($form_message); ?></textarea>
                    </div>
                    <button type="submit" class="btn">Submit Message</button>
                </form>
            </div>
        </div>
    </div>
</section>

<?php include 'includes/footer.php'; ?>