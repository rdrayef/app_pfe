import React from 'react'
import { View, Text, ScrollView, SafeAreaView } from 'react-native'
import { Divider } from 'react-native-elements'
import About from '../Components/RestaurantDetails/About'
import MenuItem from '../Components/RestaurantDetails/MenuItem'
import ViewCart from '../Components/RestaurantDetails/ViewCart'


const foods = [
    {
        title: 'Köttbullar',
        description: 'Minced pork or beef, onion, egg, milk, and breadcrumbs.',
        price: '$19.87',
        image: 'https://nomadparadise.com/wp-content/uploads/2020/09/swedish-food-1.jpg',
    },

    {
        title: 'Ostkaka ',
        description: ' reces ipcontain milk, wheat flour, and rennet.In the southern, almonds, egg, cream, and sugar are added, leading to a slightly different texture.',
        price: '$7.50',
        image: 'https://nomadparadise.com/wp-content/uploads/2020/09/swedish-food-13.jpg',
    },
    {
        title: 'Kalops',
        description: 'It’s a tasty meat stew that has been cooked slowly for a long time. Its origins are from Skåne',
        price: '$23.00',
        image: 'https://st2.depositphotos.com/1000538/5640/i/950/depositphotos_56408761-stock-photo-swedish-kalops.jpg',
    },
    {
        title: 'Semla  ',
        description: 'This pastry consists of a simple wheat bun, flavored with cardamom. The top is cut off, and it’s filled with almond paste and whipped cream. ',
        price: '$5.70',
        image: 'https://nomadparadise.com/wp-content/uploads/2020/09/swedish-food-4.jpg',
    },
    {
        title: 'Smörgåstårta ',
        description: 'Smörgåstårta with salmon and seafood and Smörgåstårta with roast beef, ham, and cheese.',
        price: '$45.70',
        image: 'https://nomadparadise.com/wp-content/uploads/2020/09/swedish-food-8.jpg',
    },
    {
        title: 'Kladdkaka',
        description: 'The difference between Mud Cake and other cakes with similar ingredients is baking soda is not used it makes it creamier.',
        price: '$8.90',
        image: 'https://nomadparadise.com/wp-content/uploads/2020/09/swedish-food-14.jpg',
    },
    {
        title: 'Räkmacka',
        description: 'Shrimp Sandwich with lettuce, mayonnaise, egg, dill, caviar, and a generous amount of shrimp',
        price: '$15.50',
        image: 'https://nomadparadise.com/wp-content/uploads/2020/09/swedish-food-2.jpg',
    },
    {
        title: 'Pytt i Panna',
        description: 'It consists of potatoes, onion, and pork or beef. Other vegetables and meat can also be added if available;',
        price: '$7.90',
        image: 'https://nomadparadise.com/wp-content/uploads/2020/09/swedish-food-10.jpg',
    },

];

export default function RestaurantDetails({ route, navigation }) {
    return (
        <View style={{ flex: 1 }}>
            <About route={route} />
            <Divider width={1.8} style={{ marginVertical: 20 }} />
            <MenuItem restaurantName={route.params.name} foods={foods} />
            <ViewCart navigation={navigation} restaurantName={route.params.name} />
        </View>
    )
}
