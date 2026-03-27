<?php include 'includes/header.php'; ?>

<!-- Page Header Banner -->
<section class="page-header" style="background-image: url('images/slider/slide1.jpg');">
    <div class="container">
        <h2>Our Gallery</h2>
        <p>A Glimpse into Life at Sandipani Vidyalaya</p>
    </div>
</section>

<!-- Main Gallery Section -->
<section class="gallery-page">
    <div class="container">

        <!-- Filter Buttons -->
        <div class="filter-buttons">
            <button class="filter-btn active" data-filter="all">All</button>
            <?php
            // Fetch distinct categories from the database
            $category_sql = "SELECT DISTINCT category FROM gallery WHERE category IS NOT NULL AND category != '' ORDER BY category";
            $category_result = $conn->query($category_sql);
            if ($category_result->num_rows > 0) {
                while ($row = $category_result->fetch_assoc()) {
                    echo '<button class="filter-btn" data-filter="' . strtolower(htmlspecialchars($row['category'])) . '">' . htmlspecialchars($row['category']) . '</button>';
                }
            }
            ?>
        </div>

        <!-- Image Grid -->
        <div class="gallery-grid-page">
            <?php
            // Fetch all images from the database
            $image_sql = "SELECT title, category, image_path FROM gallery ORDER BY upload_date DESC";
            $image_result = $conn->query($image_sql);
            if ($image_result->num_rows > 0) {
                while ($row = $image_result->fetch_assoc()) {
                    echo '<div class="gallery-item-page" data-category="' . strtolower(htmlspecialchars($row['category'])) . '">';
                    echo '  <a href="' . htmlspecialchars($row['image_path']) . '" class="lightbox-trigger">';
                    echo '    <img src="' . htmlspecialchars($row['image_path']) . '" alt="' . htmlspecialchars($row['title']) . '">';
                    echo '    <div class="overlay"><i class="fas fa-search-plus"></i></div>';
                    echo '  </a>';
                    echo '</div>';
                }
            } else {
                echo '<p>No images found in the gallery.</p>';
            }
            ?>
        </div>

    </div>
</section>

<!-- Lightbox Modal Structure -->
<div id="lightbox-modal" class="lightbox">
    <span class="lightbox-close">&times;</span>
    <img class="lightbox-content" id="lightbox-image">
    <div id="lightbox-caption"></div>
</div>


<?php include 'includes/footer.php'; ?>