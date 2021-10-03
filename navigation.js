import React from 'react'
import { View, Text } from 'react-native'
import { createStackNavigator } from "@react-navigation/stack";
import { NavigationContainer } from "@react-navigation/native";
import Home from './Screens/Home';
import RestaurantDetails from './Screens/RestaurantDetails';
import { Provider as ReduxProvider } from 'react-redux';
import configureStore from "./Redux/store";
import OrderCompleted from './Screens/OrderCompleted';

const store = configureStore();

export default function RootNavigation() {
    const Stack = createStackNavigator();

    const screenOptions = {
        headerShown: false,
    };
    if (Platform.OS === 'android') { // only android needs polyfill
        require('intl'); // import intl object
        require('intl/locale-data/jsonp/en-IN'); // load the required locale details
    }
    return (
        <ReduxProvider store={store}>
            <NavigationContainer>
                <Stack.Navigator initialRouteName="Home" screenOptions={screenOptions}>
                    <Stack.Screen name="Home" component={Home} />
                    <Stack.Screen name="RestaurantDetails" component={RestaurantDetails} />
                    <Stack.Screen name="OrderCompleted" component={OrderCompleted} />
                </Stack.Navigator>
            </NavigationContainer>
        </ReduxProvider>
    )
}
