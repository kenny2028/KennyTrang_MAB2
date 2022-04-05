package com.example.lab8_3.Data

import com.example.lab8_3.dataModel.Fruits

object SampleData {
    val fruitsList = ArrayList<Fruits>()

    init {
        //Add custom fruits
        fruitsList.add(Fruits("Dragonfruit"))
        fruitsList.add(Fruits("Passionfruit"))
        fruitsList.add(Fruits("Lychee"))
        fruitsList.add(Fruits("Kiwi"))
        fruitsList.add(Fruits("Dates"))
        fruitsList.add(Fruits("Pineapple"))
        fruitsList.add(Fruits("Watermelon"))
        fruitsList.add(Fruits("Cantelope"))
    }
}