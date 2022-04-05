package com.example.lab8_3

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.lab8_3.Adapter.ViewHolder
import com.example.lab8_3.dataModel.Fruits

class Adapter(private val fruitsList: ArrayList<Fruits>): RecyclerView.Adapter<Adapter.ViewHolder>() {

    //Viewholder class
    class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
        val fruitstextview: TextView = view.findViewById(R.id.textView)
    }



    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        //Inflater

        val layoutInflater = LayoutInflater.from(parent.context)
        val itemViewHolder = layoutInflater.inflate(R.layout.layoutcell,parent, false)

        return ViewHolder(itemViewHolder)

    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val fruit = fruitsList[position]
        holder.fruitstextview.text = fruit.name
    }

    override fun getItemCount() = fruitsList.size

}