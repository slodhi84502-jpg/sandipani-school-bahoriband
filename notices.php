<?php include 'includes/header.php'; ?>

<!-- Page Header Banner -->
<section class="page-header" style="background-image: url('images/slider/slide2.jpg');">
    <div class="container">
        <h2>Notice Board</h2>
        <p>All Important Updates and Announcements</p>
    </div>
</section>

<!-- Main Notices List Section -->
<section class="notices-list-page">
    <div class="container">
        <div class="notices-wrapper">
            <?php
            // Database se saare "Active" notices ko nikaalein, sabse naye upar
            $sql = "SELECT * FROM notice_board WHERE status = 'Active' ORDER BY notice_date DESC";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                // Har notice ke liye ek card banayein
                while ($row = $result->fetch_assoc()) {
                    echo '<div class="notice-item-full">';
                    echo '  <div class="notice-header">';
                    echo '      <span class="notice-date-full">' . date('d M, Y', strtotime($row['notice_date'])) . '</span>';
                    echo '      <span class="notice-category">' . htmlspecialchars($row['category'] ?? 'General') . '</span>';
                    echo '  </div>';
                    echo '  <h3 class="notice-title-full">' . htmlspecialchars($row['title']) . '</h3>';
                    echo '  <p class="notice-description">' . nl2br(htmlspecialchars($row['description'])) . '</p>';
                    
                    if (!empty($row['attachment'])) {
                        echo '<a href="uploads/notices/' . htmlspecialchars($row['attachment']) . '" class="btn-secondary" target="_blank"><i class="fas fa-download"></i> Download Attachment</a>';
                    }
                    
                    echo '</div>';
                }
            } else {
                echo '<p>No notices are available at the moment.</p>';
            }
            ?>
        </div>
    </div>
</section>

<?php include 'includes/footer.php'; ?>