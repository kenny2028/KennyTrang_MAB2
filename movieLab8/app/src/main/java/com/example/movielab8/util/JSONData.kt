package com.example.movielab8.util

import android.content.Context
import android.util.Log
import com.android.volley.Request
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.example.movielab8.modeldata.anime
import com.example.movielab8.viewModel.AnimeViewModel
import org.json.JSONException
import org.json.JSONObject

class JSONData {
    fun loadJSON(context: Context, animeViewModel: AnimeViewModel) {

        //val url = "https://api.jikan.moe/v4/top/anime"
        val url = "https://api.jikan.moe/v4/seasons/upcoming"

        //Start Queue for Volley
        val queue = Volley.newRequestQueue(context)


        //Request full string for URL
        val request = StringRequest(
            Request.Method.GET, url,
                {response ->
                    parseJSON(response, animeViewModel)
                },
                {
                    Log.e("RESPONSE", error("request failed"))
                }
            )
        queue.add(request)
    }

    fun parseJSON(response: String, animeViewModel: AnimeViewModel) {
        val dataList = ArrayList<anime>()

        try {
            val jsonObject = JSONObject(response)
            val dataArray = jsonObject.getJSONArray("data")

            for (i in 0 until dataArray.length()) {
                val animeObject = dataArray.getJSONObject(i)

                //Value Setter
                val rank = animeObject.getInt("mal_id")
                val title = animeObject.getString("title")

                //access images
                val imageobject = animeObject.getJSONObject("images")
                val getJPG = imageobject.getJSONObject("jpg")
                val animeimageURL = getJPG.getString("image_url")
                print("Anime | " + title + " " + rank + " " + animeimageURL)
                val newAnime = anime(rank, title, animeimageURL)
                dataList.add(newAnime)
            }

        } catch (e: JSONException) {
            e.printStackTrace()
        }

        //update viewModel
        animeViewModel.updateList(dataList)

    }



}