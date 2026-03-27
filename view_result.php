<?php include 'includes/header.php'; ?>

<section class="page-header">
    <div class="container">
        <h2>Check Your Result</h2>
    </div>
</section>

<section class="result-check-form">
    <div class="container">
        <form action="view_result.php" method="GET" class="data-form">
            <p>Please enter your Roll Number and select your class to view your exam results.</p>
            <div class="form-group">
                <label for="roll_number">Roll Number *</label>
                <input type="text" name="roll_number" required>
            </div>
            <div class="form-group">
                <label for="class_id">Class *</label>
                <select name="class_id" required>
                     <option value="">Select Class</option>
                    <?php
                    // Populate class dropdown
                    $classes = $conn->query("SELECT id, class_name, section FROM classes ORDER BY class_name");
                    while($class = $classes->fetch_assoc()) {
                        echo "<option value='{$class['id']}'>{$class['class_name']} - {$class['section']}</option>";
                    }
                    ?>
                </select>
            </div>
            <button type="submit" class="btn">View Result</button>
        </form>

        <?php
        // --- Display Result Logic ---
        if (isset($_GET['roll_number']) && isset($_GET['class_id'])) {
            $roll_number = filter_input(INPUT_GET, 'roll_number', FILTER_SANITIZE_NUMBER_INT);
            $class_id = filter_input(INPUT_GET, 'class_id', FILTER_SANITIZE_NUMBER_INT);

            // Fetch student and result data...
            // Display in a well-formatted table.
            echo "<h3>Results for Roll Number: " . htmlspecialchars($roll_number) . "</h3>";
            // ... (Your SQL queries and result table display code goes here) ...
        }
        ?>
    </div>
</section>

<?php include 'includes/footer.php'; ?>