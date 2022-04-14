package com.example.movielab8

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.activity.viewModels
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.movielab8.util.JSONData
import com.example.movielab8.viewModel.AnimeViewModel


class MainActivity : AppCompatActivity() {

    private val viewModel: AnimeViewModel by viewModels()



    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        if (viewModel.animeList.value == null) {
            val loader = JSONData()
            loader.loadJSON(this.applicationContext, viewModel)
        }

        val recyclerView: RecyclerView = findViewById(R.id.RecyclerView)

        //Recycler View Manager
        recyclerView.layoutManager = LinearLayoutManager(this,LinearLayoutManager.VERTICAL, false)

        //Create Adapter
        val adapter = AnimeAdapter(viewModel)

        //Set RecyclerView's Adapter
        recyclerView.adapter = adapter

        //Make watcher/observer

        viewModel.animeList.observe(this, Observer {
            adapter.update()
        })


    }
}