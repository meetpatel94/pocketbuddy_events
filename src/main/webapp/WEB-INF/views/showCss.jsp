<style>
:root {
  --primary: #0056b3;
  --primary-light: #e6f0ff;
  --secondary: #d2005e;
  --dark: #222;
  --light: #f8f9fa;
  --text: #333;
  --text-light: #666;
  --radius: 12px;
  --shadow: 0 6px 16px rgba(0,0,0,0.1);
  --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
}

body {
  font-family: 'Segoe UI', sans-serif;
  color: var(--text);
  background: #f5f7fa;
  line-height: 1.6;
}

#speakersSection { padding: 80px 0; background: var(--light); }

.headline-box {
  text-align: center;
  margin-bottom: 50px;
}
.headline-box h2 {
  font-size: 36px;
  font-weight: 700;
  position: relative;
  display: inline-block;
}
.headline-box h2:after {
  content: '';
  position: absolute;
  width: 60px;
  height: 3px;
  background: var(--primary);
  bottom: -10px;
  left: 50%;
  transform: translateX(-50%);
}
.headline-box p {
  color: var(--text-light);
  max-width: 700px;
  margin: 0 auto;
}

.speaker-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 25px;
}

.speaker-card {
  opacity: 0;
  transform: translateY(20px);
  transition: opacity 0.5s ease, transform 0.5s ease;
}
.speaker-card.visible { opacity: 1; transform: translateY(0); }

.card-wrapper {
  background: #fff;
  border-radius: var(--radius);
  box-shadow: var(--shadow);
  overflow: hidden;
  transition: var(--transition);
  height: 100%;
  display: flex;
  flex-direction: column;
}
.card-wrapper:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 24px rgba(0,0,0,0.15);
}

.image-container {
  position: relative;
  height: 200px;
  overflow: hidden;
  background: #f5f7fa;
}
.card-wrapper img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: var(--transition);
  opacity: 0;
}
.card-wrapper img.loaded { opacity: 1; }

.seminar-badge {
  position: absolute;
  top: 10px;
  right: 10px;
  background: #6C5CE7;
  color: white;
  padding: 5px 14px;
  border-radius: 20px;
  font-size: 11px;
  font-weight: bold;
  z-index: 2;
  text-transform: uppercase;
}

.city-tag {
  position: absolute;
  top: 10px;
  left: 10px;
  background: rgba(0,0,0,0.7);
  color: white;
  padding: 5px 12px;
  border-radius: 20px;
  font-size: 12px;
  font-weight: bold;
  z-index: 2;
}

.info-box { padding: 20px; flex-grow: 1; display: flex; flex-direction: column; }
.info-box h3 a {
  font-size: 20px;
  font-weight: 700;
  color: var(--primary);
  text-decoration: none;
  transition: var(--transition);
}
.info-box h3 a:hover { color: #003d7a; }

.seminar-meta {
  display: flex;
  align-items: center;
  margin-bottom: 12px;
  color: var(--text-light);
  font-size: 14px;
}
.seminar-meta i {
  margin-right: 8px;
  color: var(--primary);
}

.seminar-description {
  color: var(--text);
  font-size: 14px;
  line-height: 1.6;
  margin-bottom: 15px;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.speaker-info {
  display: flex;
  align-items: center;
  margin-top: 15px;
  padding-top: 15px;
  border-top: 1px solid #eee;
}
.speaker-name { font-weight: 600; font-size: 14px; margin-bottom: 4px; }
.speaker-title { font-size: 12px; color: var(--text-light); }

.view-details-btn {
  margin-top: auto;
  padding: 10px 20px;
  background: var(--primary);
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  transition: var(--transition);
  align-self: flex-start;
  box-shadow: 0 2px 8px rgba(0, 86, 179, 0.2);
  display: flex;
  align-items: center;
  gap: 8px;
}
.view-details-btn:hover {
  background: #003d7a;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 86, 179, 0.3);
}

.filter-container {
  background: white;
  padding: 20px;
  border-radius: var(--radius);
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  margin-bottom: 40px;
}
.filter-controls {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap;
  gap: 15px;
}
.filter-group {
  position: relative;
  min-width: 200px;
}
.filter-group label {
  display: block;
  margin-bottom: 6px;
  font-size: 13px;
  font-weight: 600;
  color: var(--text-light);
  text-transform: uppercase;
}
.filter-controls select {
  padding: 12px 20px;
  padding-right: 40px;
  border-radius: 8px;
  border: 1px solid #e0e6ed;
  font-size: 14px;
  width: 100%;
  background-color: white;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
  appearance: none;
  background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
  background-repeat: no-repeat;
  background-position: right 15px center;
  background-size: 16px;
  cursor: pointer;
  transition: var(--transition);
}
.filter-controls select:focus {
  outline: none;
  border-color: var(--primary);
  box-shadow: 0 0 0 3px rgba(0, 86, 179, 0.1);
}
.filter-actions { display: flex; align-items: flex-end; gap: 10px; }
.filter-btn {
  padding: 12px 24px;
  border-radius: 8px;
  background: var(--primary);
  color: white;
  border: none;
  font-weight: 600;
  cursor: pointer;
  transition: var(--transition);
  box-shadow: 0 4px 12px rgba(0, 86, 179, 0.2);
  display: flex;
  align-items: center;
  gap: 8px;
  margin-top: 24px;
}
.filter-btn:hover {
  background: #003d7a;
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(0, 86, 179, 0.3);
}
.reset-btn {
  padding: 12px 18px;
  border-radius: 8px;
  background: white;
  color: var(--text-light);
  border: 1px solid #e0e6ed;
  font-weight: 500;
  cursor: pointer;
  transition: var(--transition);
  margin-top: 24px;
}
.reset-btn:hover {
  background: #f8f9fa;
  border-color: #d0d7de;
  color: var(--text);
}

.no-events {
  grid-column: 1 / -1;
  text-align: center;
  padding: 50px;
  color: var(--text-light);
  font-style: italic;
  background: white;
  border-radius: var(--radius);
  box-shadow: var(--shadow);
}

/* Modal */
.event-modal .modal-content { border-radius: var(--radius); border: none; }
.event-modal .modal-header {
  border-bottom: 1px solid #eee;
  padding: 20px 25px;
  background: var(--primary);
}
.event-modal .modal-title { font-weight: 700; color: white; font-size: 22px; }
.event-modal .close { color: white; opacity: 0.8; }
.event-modal .close:hover { opacity: 1; color: white; transform: rotate(90deg); }
.event-modal .modal-body { padding: 25px; }
.event-modal .event-image {
  width: 100%;
  height: 250px;
  object-fit: cover;
  border-radius: 8px;
  margin-bottom: 20px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}
.event-modal .event-details { margin-bottom: 20px; }
.event-modal .event-details h5 { font-size: 18px; margin-bottom: 15px; font-weight: 700; }
.event-modal .event-details p { font-size: 15px; display: flex; align-items: center; }
.event-modal .event-details i { color: var(--primary); margin-right: 10px; width: 20px; }
.event-modal .event-description {
  background: var(--primary-light);
  padding: 20px;
  border-radius: 8px;
  margin-top: 20px;
}
.event-modal .event-description h5 { font-size: 18px; margin-bottom: 15px; }
.event-modal .event-description p { font-size: 15px; line-height: 1.7; }

/* Responsive */
@media (max-width: 992px) {
  .speaker-grid { grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 20px; }
  .headline-box h2 { font-size: 32px; }
}
@media (max-width: 768px) {
  .filter-container { padding: 15px; }
  .filter-controls { flex-direction: column; align-items: stretch; }
  .filter-group { width: 100%; }
  .filter-actions { width: 100%; justify-content: space-between; }
  .filter-btn, .reset-btn { flex: 1; }
  .image-container { height: 180px; }
  .info-box { padding: 15px; }
}
@media (max-width: 576px) {
  #speakersSection { padding: 60px 0; }
  .headline-box h2 { font-size: 28px; }
  .headline-box p { font-size: 15px; padding: 0 15px; }
  .image-container { height: 160px; }
  .event-modal .modal-body { padding: 20px; }
  .event-modal .event-image { height: 180px; }
}
</style>