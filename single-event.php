<?php include 'includes/header.php'; ?>

<section class="page-header"><div class="container"><h2>Event Details</h2></div></section>

<section class="single-item-page">
    <div class="container" style="max-width: 900px;">
        <?php
        // Check karein ki ID di gayi hai ya nahi
        if (isset($_GET['id']) && is_numeric($_GET['id'])) {
            $event_id = $_GET['id'];
            $stmt = $conn->prepare("SELECT * FROM events WHERE id = ?");
            $stmt->bind_param("i", $event_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                echo '<h1>' . htmlspecialchars($row['event_name']) . '</h1>';
                echo '<p class="meta"><strong>Date:</strong> ' . date('d M, Y', strtotime($row['event_date'])) . '</p>';
                if (!empty($row['image'])) {
                    echo '<img src="uploads/events/'.htmlspecialchars($row['image']).'" class="single-item-image">';
                }
                echo '<div class="single-item-content">' . nl2br(htmlspecialchars($row['description'])) . '</div>';
            } else {
                echo '<h1>Event Not Found</h1>';
            }
        } else {
            echo '<h1>Invalid Request</h1>';
        }
        ?>
    </div>
</section>

<?php include 'includes/footer.php'; ?>