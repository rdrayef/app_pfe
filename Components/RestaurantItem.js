import React from 'react'
import { View, Text, Image, TouchableOpacity } from 'react-native'
import MaterialCommunityIcons from "react-native-vector-icons/MaterialCommunityIcons";

export const localRestaurants = [
    {
        name: "Sweden's Charm",
        image_url:
            "https://d3aux7tjp119y2.cloudfront.net/images/Tak2-CMSTemplate_IrMZHla.width-1500.jpg",
        categories: ["Cafe", "Restaurant"],
        price: "$$",
        reviews: 1244,
        rating: 4.8,
    },
    {
        name: "Beachside Sushi",
        image_url:
            "https://images.pexels.com/photos/3475617/pexels-photo-3475617.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
        categories: ["Cafe", "Bar", "Restaurant"],
        price: "$$",
        reviews: 1244,
        rating: 4.7,
    },
    {
        name: "Benihana",
        image_url:
            "https://www.babaphuket.com/wp-content/uploads/2016/12/11-Baba-Soul-Food-Thai-Cuisine-Best-Restaurant-in-Phuket-1500x848.jpg",
        categories: ["Cafe", "Bar"],
        price: "$$",
        reviews: 1244,
        rating: 3.9,
    },
    {
        name: "India's Grill",
        image_url:
            "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVzdGF1cmFudCUyMGludGVyaW9yfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
        categories: ["Indian", "Bar"],
        price: "$$",
        reviews: 700,
        rating: 4.1,
    },
    {
        name: "Paris sweets",
        image_url:
            "https://images.pexels.com/photos/205961/pexels-photo-205961.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        categories: ["Indian", "Bar"],
        price: "$$",
        reviews: 700,
        rating: 4.5,
    },
    {
        name: "Al Fassia Aguedal",
        image_url:
            "https://cdn.kimkim.com/files/a/content_articles/featured_photos/9f27e2cd5eac7c8b5ec57c5a08e0eff5489152dc/big-e4258e84df811bc98e5af0ec04e72722.jpg",
        categories: ["Restaurant", "Moroccan"],
        price: "$$",
        reviews: 700,
        rating: 4.8,
    },
];

export default function RestaurantItem({ navigation, ...props }) {
    return (
        <>
            {
                props.restaurantData.map((restaurant, index) =>
                (
                    <TouchableOpacity key={index} activeOpacity={1} style={{ marginBottom: 30 }} onPress={() => navigation.navigate("RestaurantDetails", {
                        name: restaurant.name,
                        image: restaurant.image_url,
                        price: restaurant.price,
                        reviews: restaurant.review_count,
                        rating: restaurant.rating,
                        categories: restaurant.categories,
                    })}>
                        <View style={{ marginTop: 10, padding: 15, backgroundColor: "white" }}>
                            <RestaurantImage image={restaurant.image_url} />
                            <RestaurantInfo name={restaurant.name} rating={restaurant.rating} />
                        </View>
                    </TouchableOpacity>
                ))}
        </>
    )
}
const RestaurantImage = (props) => (
    <>
        <Image source={{ uri: props.image }}
            style={{ width: "100%", height: 180 }}
        />
        <TouchableOpacity style={{ position: "absolute", right: 20, top: 20 }}>
            <MaterialCommunityIcons name="heart-outline" size={25} color="#fff" />
        </TouchableOpacity>
    </>
);

const RestaurantInfo = (props) => (
    <View style={{ flexDirection: "row", justifyContent: "space-between", alignItems: "center", marginTop: 10, }}>
        <View>
            <Text style={{ fontSize: 15, fontWeight: "bold" }}>{props.name}</Text>
            <Text style={{ fontSize: 13, color: "gray", fontWeight: "500" }} >30-45 min</Text>
        </View>
        <View style={{ backgroundColor: "#eee", height: 30, width: 30, alignItems: "center", borderRadius: 15, justifyContent: "center" }}>
            <Text>{props.rating}</Text>
        </View>
    </View>
)


