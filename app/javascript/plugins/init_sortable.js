import Sortable from 'sortablejs';
import Rails from '@rails/ujs'

const initSortable = () => {
    let el = document.getElementById('favourites');
    if (el) {
      let sortable = Sortable.create(el, { animation: 150 });
    }
  };

export { initSortable };
