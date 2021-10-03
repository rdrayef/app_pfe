import React, { useEffect, useState } from "react";
import { View, Text, StyleSheet, ScrollView } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import { useSelector } from "react-redux";
import LottieView from "lottie-react-native";
import { Audio } from 'expo-av';
import { Vibration } from "react-native";
import firebase from "../firebase";
import MenuItem from "../Components/RestaurantDetails/MenuItem";

export default function OrderCompleted() {
    const [lastOrder, setLastOrder] = useState({
        items: [
            {
                title: "Bologna",
                description: "With butter lettuce, tomato and sauce bechamel",
                price: "$13.50",
                image:
                    "https://www.modernhoney.com/wp-content/uploads/2019/08/Classic-Lasagna-14-scaled.jpg",
            },
        ],
    });
    const styles = StyleSheet.create({
        container: {
            paddingTop: Platform.OS === "android" ? 25 : 0,
            backgroundColor: "white",
            flex: 1,
        },
    });

    {/* Audio Effects and Vibration */ }
    const [sound, setSound] = React.useState();
    async function playSound() {

        console.log('Loading Sound');
        const { sound } = await Audio.Sound.createAsync(
            require('../assets/audios/success.mp3')
        );
        setSound(sound);
        Vibration.vibrate();
        Vibration.cancel();
        console.log('Playing Sound');
        await sound.playAsync();
    }

    const { items, restaurantName } = useSelector(
        (state) => state.cartReducer.selectedItems
    );

    const total = items
        .map((item) => Number(item.price.replace("$", "")))
        .reduce((prev, curr) => prev + curr, 0);

    const totalUSD = total.toLocaleString("en", {
        style: "currency",
        currency: "USD",
    });

    useEffect(() => {
        const db = firebase.firestore();
        const unsucbscribe = db.collection("orders")
            .orderBy('createdAt', 'desc')
            .limit(1)
            .onSnapshot((snapshot) => {
                snapshot.docs.map((doc) => {
                    setLastOrder(doc.data());
                })
            })
        return () => unsucbscribe();
    }, [lastOrder])

    return (
        <SafeAreaView style={styles.container}>

            <View style={{ margin: 15, alignItems: "center", height: "100%", }}>
                {/* Validation annimation */}
                <LottieView onLayout={() => playSound()}
                    style={{ height: 130, alignSelf: "center", marginBottom: 30 }}
                    source={require("../assets/animations/check-mark.json")}
                    autoPlay
                    loop={false}
                />
                <Text style={{ fontSize: 20, fontWeight: "bold", textAlign: "center", lineHeight: 27, marginBottom: 10 }}>
                    Your order at {restaurantName} has been placed successfully for:{" "}
                    {totalUSD}
                </Text>
                <ScrollView>
                    <MenuItem foods={lastOrder.items} hideCheckbox={true} />

                    {/* Cooking annimation */}
                    <LottieView
                        style={{ height: 220, alignSelf: "center", marginBottom: 30 }}
                        source={require("../assets/animations/cooking.json")}
                        autoPlay
                        speed={0.8}
                        loop={false}
                    />
                </ScrollView>
            </View>
        </SafeAreaView>
    );
}
