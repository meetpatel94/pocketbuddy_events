<!-- Combined JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>

<script>
$(function() {
  new WOW().init();

  // Lazy load images
  const lazyLoadObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const img = entry.target;
        img.src = img.dataset.src;
        img.classList.add('loaded');
        lazyLoadObserver.unobserve(img);
      }
    });
  }, { rootMargin: '100px 0px', threshold: 0.01 });

  $('.lazy').each((i, img) => lazyLoadObserver.observe(img));

  // Fade in cards
  const cardObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        cardObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1 });

  $('.speaker-card').each((i, card) => cardObserver.observe(card));

  // Filter events
  function applyFilters() {
    const city = $('#cityFilter').val().toLowerCase();
    const state = $('#stateFilter').val().toLowerCase();
    let hasVisible = false;
    
    $('.no-events').remove();
    
    $('.speaker-card').each(function() {
      const show = (city === 'all' || $(this).data('city') === city) && 
                  (state === 'all' || $(this).data('state') === state);
      
      if (show) {
        $(this).show().addClass('visible');
        hasVisible = true;
      } else {
        $(this).hide().removeClass('visible');
      }
    });
    
    if (!hasVisible) {
      $('#eventsContainer').append(
        '<div class="no-events wow animate__animated animate__fadeIn">' +
        'No music events found for the selected filters. Please try different filters.' +
        '</div>'
      );
    }
  }

  $('#applyFilter').click(applyFilters);
  $('#resetFilter').click(() => {
    $('#cityFilter, #stateFilter').val('all');
    applyFilters();
  });
  
  applyFilters();
  
  // Modal handler
  $('#eventModal').on('show.bs.modal', function(e) {
    const btn = $(e.relatedTarget);
    const modal = $(this);
    modal.find('.modal-title, #modalEventName').text(btn.data('name'));
    modal.find('#modalEventImage').attr('src', btn.data('image'));
    modal.find('#modalEventCity').text(btn.data('city'));
    modal.find('#modalEventDate').text(btn.data('date'));
    modal.find('#modalEventDescription').text(btn.data('description'));
  });

  // Image error handling
  $('.lazy').on('error', function() {
    this.src = 'data:image/svg+xml;charset=UTF-8,%3Csvg xmlns="http://www.w3.org/2000/svg" width="300" height="200" viewBox="0 0 300 200"%3E%3Crect width="300" height="200" fill="%23f0f0f0"/%3E%3Ctext x="150" y="100" font-family="Arial" font-size="16" text-anchor="middle" fill="%23aaa"%3EImage not available%3C/text%3E%3C/svg%3E';
    $(this).addClass('loaded');
  });
});
</script>