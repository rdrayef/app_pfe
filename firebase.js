import firebase from "firebase";
const firebaseConfig = {
    apiKey: "AIzaSyDqlWvWIAoNh3Oek9qkjnwAtM3A2Y4yqjY",
    authDomain: "uber-eats-clone-c73e7.firebaseapp.com",
    projectId: "uber-eats-clone-c73e7",
    storageBucket: "uber-eats-clone-c73e7.appspot.com",
    messagingSenderId: "197523256232",
    appId: "1:197523256232:web:988d833b1377954567e39d",
    measurementId: "G-E8YVJRTS1N"
};

!firebase.apps.length ? firebase.initializeApp((firebaseConfig)) : firebase.app();

export default firebase;