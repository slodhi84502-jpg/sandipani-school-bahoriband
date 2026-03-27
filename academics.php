<?php include 'includes/header.php'; ?>

<!-- Page Header Banner -->
<section class="page-header" style="background-image: url('images/slider/slide3.jpg');">
    <div class="container">
        <h2>Academics</h2>
        <p>Curriculum, Fees, and Examination Details</p>
    </div>
</section>

<!-- Main Academics Content Section -->
<section class="academics-content">
    <div class="container">

        <!-- Classes Offered -->
        <div class="academics-section">
            <h3>Classes Offered</h3>
            <p>Sandipani Vidyalaya offers a complete and structured educational path from the foundational years to higher secondary education. We provide classes from **Nursery to Class 12th**, ensuring a continuous and progressive learning journey for our students.</p>
        </div>

        <!-- Teaching Methodology -->
        <div class="academics-section">
            <h3>Our Teaching Methodology</h3>
            <p>Our teaching methodology is a blend of traditional and modern techniques. We focus on interactive learning, practical application of knowledge, and the use of digital tools to make education engaging and effective. Our curriculum is designed to foster critical thinking, creativity, and problem-solving skills, preparing students for the challenges of the future.</p>
        </div>

        <!-- Fee Structure Section -->
        <div class="academics-section">
            <h3>Fee Structure (Session 2024-25)</h3>
            <p>We believe in transparency regarding our fee structure. Below is a detailed breakdown of the fees for the current academic session. For any further queries, please feel free to contact the school office.</p>
            
            <div class="fee-table-container">
                <table class="fee-table">
                    <thead>
                        <tr>
                            <th>Class</th>
                            <th>Admission Fee</th>
                            <th>Tuition Fee (Annually)</th>
                            <th>Annual Charges</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // Fetch fee structure from the database
                        $sql = "SELECT c.class_name, c.section, fs.tuition_fee, fs.admission_fee, fs.annual_charges, fs.other_charges 
                                FROM fee_structure fs
                                JOIN classes c ON fs.class_id = c.id
                                ORDER BY c.id";

                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            // Output data for each row
                            while ($row = $result->fetch_assoc()) {
                                $total_fee = $row['admission_fee'] + $row['tuition_fee'] + $row['annual_charges'] + $row['other_charges'];
                                echo "<tr>";
                                echo "<td data-label='Class'>" . htmlspecialchars($row['class_name']) . " " . htmlspecialchars($row['section']) . "</td>";
                                echo "<td data-label='Admission Fee'>₹ " . number_format($row['admission_fee']) . "</td>";
                                echo "<td data-label='Tuition Fee'>₹ " . number_format($row['tuition_fee']) . "</td>";
                                echo "<td data-label='Annual Charges'>₹ " . number_format($row['annual_charges']) . "</td>";
                                echo "<td data-label='Total'><strong>₹ " . number_format($total_fee) . "</strong></td>";
                                echo "</tr>";
                            }
                        } else {
                            echo "<tr><td colspan='5'>Fee structure details are not available at the moment. Please contact the school office.</td></tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>
            <a href="path/to/fee_structure.pdf" class="btn" download>
                <i class="fas fa-download"></i> Download Fee Structure PDF
            </a>
        </div>
        
        <!-- Exam Schedule Section -->
        <div class="academics-section">
            <h3>Examination Schedule</h3>
            <p>The school conducts regular assessments to monitor student progress. The major examinations are scheduled as follows:</p>
            <ul>
                <li><strong>Quarterly Examinations:</strong> July</li>
                <li><strong>Half-Yearly Examinations:</strong> September - October</li>
                <li><strong>Pre-Board Examinations (for 10th & 12th):</strong> December - January</li>
                <li><strong>Annual Examinations:</strong> February - March</li>
            </ul>
        </div>

    </div>
</section>

<?php include 'includes/footer.php'; ?>