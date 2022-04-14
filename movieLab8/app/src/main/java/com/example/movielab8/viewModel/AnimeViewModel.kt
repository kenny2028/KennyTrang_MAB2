package com.example.movielab8.viewModel

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.movielab8.modeldata.anime

class AnimeViewModel: ViewModel() {
    val animeList = MutableLiveData<ArrayList<anime>>()

    fun updateList(newList: ArrayList<anime>) {
        animeList.value = newList
    }

}