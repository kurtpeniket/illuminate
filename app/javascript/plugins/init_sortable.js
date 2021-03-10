import Sortable from 'sortablejs';

const initSortable = () => {
  let el = document.getElementById('favourites');
  if (el) {
    let sortable = Sortable.create(el, { animation: 150 });
  }
};

export { initSortable };
