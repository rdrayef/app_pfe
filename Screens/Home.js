import React, { useEffect } from 'react'
import { useState } from 'react';
import { StyleSheet, View, ScrollView, SafeAreaView } from 'react-native';
import { Divider } from 'react-native-elements/dist/divider/Divider';
import BottomTabs from '../Components/BottomTabs';
import Categories from '../Components/Categories';
import HeaderTabs from '../Components/HeaderTab'
import RestaurantItem, { localRestaurants } from '../Components/RestaurantItem';
import SearchBar from '../Components/SearchBar';


const YELP_API_KEY = "3207pcEWMNjiusyryIrk1G39haZNyGzRya4NXnk7UmG6fKBDVmEs7OZGwYaj-kyo0EU8HwAnboP2rmAakCm1AC_v3lJm7GD3TVIrmpU6dL05COOHZFFkEoEzGKVNYXYx";


export default function Home({ navigation }) {
    const [restaurantData, setRestaurantData] = useState(localRestaurants);
    const [city, setCity] = useState("LA");
    const [activeTab, setActiveTab] = useState('Delivery');




    const getRestaurantsFromYelp = () => {
        const yelpUrl = `https://api.yelp.com/v3/businesses/search?term=restaurants&location=${city}`;

        const apiOptions = {
            headers: {
                Authorization: `Bearer ${YELP_API_KEY}`,

            },
        }

        return fetch(yelpUrl, apiOptions).then((res) => res.json()).then((json) => setRestaurantData(json.businesses.filter((business) => business.transactions.includes(activeTab.toLowerCase())
        )
        ));
    };

    useEffect(() => {
        getRestaurantsFromYelp();
    }, [city, activeTab]);

    const styles = StyleSheet.create({
        container: {
            paddingTop: Platform.OS === 'android' ? 25 : 0,
            backgroundColor: "#eee",
            flex: 1,
        },
    });


    return (
        <SafeAreaView style={styles.container}>
            <View style={{
                backgroundColor: "white",
                padding: 15,
            }}>
                <HeaderTabs activeTab={activeTab} setActiveTab={setActiveTab} />
                <SearchBar cityHandler={setCity} />
            </View>
            <ScrollView showsVerticalScrollIndicator={false}>
                <Categories />
                <RestaurantItem restaurantData={restaurantData} navigation={navigation} />
            </ScrollView>
            <Divider width={1} />
            <BottomTabs />
        </SafeAreaView>
    )
}
