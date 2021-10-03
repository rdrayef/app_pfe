import React from 'react'
import { View, Text, TouchableOpacity } from 'react-native'
import FontAwesome5 from "react-native-vector-icons/FontAwesome5";



export default function BottomTabs() {
    return (
        <View style={{ flexDirection: "row", margin: 10, marginHorizontal: 15, justifyContent: "space-between" }}>
            {/* Icon */}
            <Icon icon="home" text="Home" />
            <Icon icon="search" text="Browse" />
            <Icon icon="shopping-bag" text="Grocery" />
            <Icon icon="receipt" text="Orders" />
            <Icon icon="user" text="Account" />
        </View>
    )
}
const Icon = (props) => {
    return (
        <TouchableOpacity>
            <View>
                <FontAwesome5
                    name={props.icon}
                    size={25}
                    style={{
                        marginBottom: 3,
                        alignSelf: "center",
                    }}
                />
                <Text style={{ fontSize: 12 }}>{props.text}</Text>
            </View>
        </TouchableOpacity>
    )
}