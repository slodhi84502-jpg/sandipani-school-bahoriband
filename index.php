<?php include 'includes/header.php'; ?>

<!-- 1. Hero Section with Image Slider -->
<section class="hero-slider">
    <div class="slide active" style="background-image: url('images/slider/slide1.jpg');"></div>
    <div class="slide" style="background-image: url('images/slider/slide2.jpg');"></div>
    <div class="slide" style="background-image: url('images/slider/slide3.jpg');"></div>
</section>

<!-- 2. Quick Info Cards -->
<section class="info-cards">
    <div class="container">
        <?php
            // Database se statistics nikalein
            $total_students = $conn->query("SELECT COUNT(*) as count FROM students WHERE status='Active'")->fetch_assoc()['count'];
            $total_teachers = $conn->query("SELECT COUNT(*) as count FROM teachers WHERE status='Active'")->fetch_assoc()['count'];
        ?>
        <div class="card">
            <i class="fas fa-user-graduate"></i>
            <h3><?php echo $total_students; ?>+</h3>
            <p>Total Students</p>
        </div>
        <div class="card">
            <i class="fas fa-chalkboard-teacher"></i>
            <h3><?php echo $total_teachers; ?>+</h3>
            <p>Experienced Teachers</p>
        </div>
        <div class="card">
            <i class="fas fa-award"></i>
            <h3>99%</h3>
            <p>Success Rate</p>
        </div>
    </div>
</section>

<!-- 3. About Us Section (Doon School Style) -->
<section class="about-home-section">
    <div class="container">
        <div class="about-main-text">
            <h2>ABOUT SANDIPANI VIDYALAYA</h2>
            <p>Located in the heart of Bahoriband, Sandipani Vidyalaya is rooted in a legacy of history, tradition, and visionary education. We are committed to shaping the future of our students through academic excellence and holistic development.</p>
            <a href="about.php" class="btn-dark">Read More</a>
        </div>
        <div class="about-cards-container">
            <div class="about-card">
                <img src="images/card-history.jpg" alt="Origin and History">
                <div class="card-content">
                    <h3>Origin & History</h3>
                    <p>Our school was founded with a vision to provide quality education in the region...</p>
                    <a href="about.php" class="btn-dark">Read More</a>
                </div>
            </div>
            <div class="about-card">
                <img src="images/card-mission.jpg" alt="Mission and Vision">
                <div class="card-content">
                    <h3>Mission & Vision</h3>
                    <p>To attract and develop exceptional students and teachers from all backgrounds...</p>
                    <a href="about.php" class="btn-dark">Read More</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 4. News and Events Section (Final Doon School Style) -->
<section class="news-events-section">
    <div class="container">
        <h2 class="section-title">NEWS AND EVENTS</h2>
        <div class="news-grid-container">
            <!-- Bada Slider (Left Side) -->
            <div class="main-news-slider">
                <div class="slider-wrapper">
                    <?php
                    $slider_news_sql = "SELECT * FROM notice_board WHERE status = 'Active' AND attachment IS NOT NULL AND attachment != '' ORDER BY notice_date DESC LIMIT 3";
                    $slider_news_result = $conn->query($slider_news_sql);
                    if ($slider_news_result->num_rows > 0) {
                        $is_first = true;
                        while ($slide = $slider_news_result->fetch_assoc()) {
                            $slide_image = 'uploads/notices/' . htmlspecialchars($slide['attachment']);
                            $active_class = $is_first ? 'active' : '';
                            echo '<div class="main-news-slide ' . $active_class . '" style="background-image: url(\'' . $slide_image . '\');">';
                            echo '  <div class="main-news-slide-content">';
                            echo '      <h3>' . htmlspecialchars($slide['title']) . '</h3>';
                            echo '      <p>' . substr(strip_tags($slide['description']), 0, 150) . '...</p>';
                            echo '      <a href="single-notice.php?id=' . $slide['id'] . '" class="btn-dark">Read More</a>';
                            echo '  </div>';
                            echo '</div>';
                            $is_first = false;
                        }
                    } else {
                        echo '<p class="no-news-message">No featured news available. Please add notices with image attachments in the admin panel.</p>';
                    }
                    ?>
                </div>
                <div class="slider-dots"></div>
            </div>
            <!-- Chote Events (Right Side) -->
            <div class="small-events-grid">
                <?php
                $small_events_sql = "SELECT * FROM events ORDER BY event_date DESC LIMIT 4";
                $small_events_result = $conn->query($small_events_sql);
                if ($small_events_result->num_rows > 0) {
                    while ($event = $small_events_result->fetch_assoc()) {
                        $event_image = !empty($event['image']) ? 'uploads/events/' . htmlspecialchars($event['image']) : 'images/default_event.png';
                        echo '<div class="small-event-card">';
                        echo '  <div class="small-event-image">';
                        echo '      <img src="' . $event_image . '" alt="' . htmlspecialchars($event['event_name']) . '">';
                        echo '  </div>';
                        echo '  <div class="small-event-content">';
                        echo '      <h4>' . htmlspecialchars($event['event_name']) . '</h4>';
                        echo '      <span>' . date('d M Y', strtotime($event['event_date'])) . '</span>';
                        echo '      <a href="single-event.php?id=' . $event['id'] . '" class="btn-dark-small">Read More</a>';
                        echo '  </div>';
                        echo '</div>';
                    }
                } else {
                     echo '<p>No recent events available.</p>';
                }
                ?>
            </div>
        </div>
    </div>
</section>

<!-- 5. Photo Gallery Preview -->
<section class="gallery-preview">
    <div class="container">
        <h2>Our Gallery</h2>
        <div class="gallery-grid">
            <?php
            $gallery_result = $conn->query("SELECT image_path, title FROM gallery ORDER BY upload_date DESC LIMIT 6");
            if ($gallery_result->num_rows > 0) {
                while($row = $gallery_result->fetch_assoc()) {
                    echo '<div class="gallery-item"><img src="' . htmlspecialchars($row['image_path']) . '" alt="' . htmlspecialchars($row['title']) . '"></div>';
                }
            } else {
                echo '<p>No images in the gallery yet.</p>';
            }
            ?>
        </div>
        <a href="gallery.php" class="btn">View Full Gallery</a>
    </div>
</section>
<!-- Message from Dignitaries Section (Doon School Style V2) -->
<section class="message-section">
    <div class="container">
        <div class="message-grid">
            
            <!-- Card 1: Chairman's Message -->
            <div class="message-card">
                <h4>MESSAGE FROM THE CHAIRMAN</h4>
                <div class="message-box">
                    <div class="message-blue-panel">
                        <a href="about.php#chairman-message" class="read-message-btn">READ MESSAGE &gt;</a>
                    </div>
                    <div class="message-photo-panel">
                        <img src="images/chairman.jpg" alt="Chairman">
                    </div>
                </div>
            </div>

            <!-- Card 2: Principal's Message -->
            <div class="message-card">
                <h4>MESSAGE FROM THE PRINCIPAL</h4>
                <div class="message-box">
                    <div class="message-blue-panel">
                        <a href="about.php#principal-message" class="read-message-btn">READ MESSAGE &gt;</a>
                    </div>
                    <div class="message-photo-panel">
                        <img src="images/principal.jpg" alt="Principal">
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<?php include 'includes/footer.php'; ?>