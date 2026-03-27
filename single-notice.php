<?php include 'includes/header.php'; ?>
<section class="page-header"><div class="container"><h2>Notice Details</h2></div></section>
<section class="single-item-page"><div class="container">
    <?php
    $notice_id = $_GET['id'];
    $sql = "SELECT * FROM notice_board WHERE id = $notice_id";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo '<h1>' . htmlspecialchars($row['title']) . '</h1>';
        echo '<p class="meta"><strong>Date:</strong> ' . date('d M, Y', strtotime($row['notice_date'])) . ' | <strong>Category:</strong> ' . htmlspecialchars($row['category']) . '</p>';
        if (!empty($row['attachment'])) {
            echo '<img src="uploads/notices/'.htmlspecialchars($row['attachment']).'" class="single-item-image">';
        }
        echo '<div class="single-item-content">' . nl2br(htmlspecialchars($row['description'])) . '</div>';
    }
    ?>
</div></section>
<?php include 'includes/footer.php'; ?>