let defaultState = {
    selectedItems: { items: [], restaurantName: '' }
}

let cartReducer = (state = defaultState, action) => {
    switch (action.type) {

        case "ADD_TO_CART": {
            let newstate = { ...state };

            if (action.payload.checkboxValue) {
                console.log("ADD TO CARTTTTT");

                newstate.selectedItems = {
                    items: [...newstate.selectedItems.items, action.payload],
                    restaurantName: action.payload.restaurantName,
                };

            } else {
                console.log(">>>>>>>REMOVE FROM CARTTTT");
                newstate.selectedItems = {
                    items: [
                        ...newstate.selectedItems.items.filter((item) => item.title != action.payload.title),
                    ],
                    restaurantName: action.payload.restaurantName,
                };
            }
            console.log(newstate, "👉");
            return newstate;
        }
        default:
            return state;
    }
}
export default cartReducer;