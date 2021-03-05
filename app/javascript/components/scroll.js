export const scroll = () => {
  const link = document.getElementById('query-link');
  const results = document.getElementById('results')
  if (link) {
    if (link.dataset.params) {
      console.log(link.dataset.params);
      results.scrollIntoView();
    } 
  }
};