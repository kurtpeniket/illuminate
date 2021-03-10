import Sortable from 'sortablejs';
// import Rails from '@rails/ujs'

const initSortable = () => {
    let el = document.getElementById('favourites');
    if (el) {
      let sortable = Sortable.create(el, {
      animation: 150,
      // filter: '.filtered',
      // onEnd: function (e) {console.log(e)}
      });
    }
  };


export { initSortable };
