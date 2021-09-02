import Sortable from 'sortablejs';
// import Rails from '@rails/ujs';


const initSortable = () => {
    let el = document.getElementById('favourites');
    if (el) {
      let sortable = new Sortable(el, {
      animation: 150,
      onEnd: function (e) {
        // console.log(e.newDraggableIndex);
        // console.log(e.currentTarget)
        // console.log(e.item.dataset.id)
        fetch(`http://www.illuminate-app.tech/favourites/sort/?id=${e.item.dataset.id}&order=${e.newDraggableIndex}&old=${e.oldDraggableIndex}`)
          .then(response => response.json())
          .then((data) => {
            console.log(data);
          });
      }
        // })
    })
  };
}


export { initSortable };
