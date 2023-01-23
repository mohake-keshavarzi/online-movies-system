let bgPreference;
let root = document.documentElement;
window.addEventListener("load", ()=>{
    bgPreference = localStorage.getItem("bgPreference");
    
    // window.alert(bgPreference);
    if (bgPreference) {
        root.style.setProperty('--background-image',`url(${bgPreference})`);
    }
});
