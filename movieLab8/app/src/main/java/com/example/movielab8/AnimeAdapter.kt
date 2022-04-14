package com.example.movielab8

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.movielab8.viewModel.AnimeViewModel
import com.squareup.picasso.Picasso


class AnimeAdapter(private val animeViewModel: AnimeViewModel): RecyclerView.Adapter<AnimeAdapter.ViewHolder>() {

    private var myanimeList = animeViewModel.animeList.value


    class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
        val titleTextView: TextView = view.findViewById(R.id.textView)
        val rankingTextView: TextView = view.findViewById(R.id.rankTextView)
        val animeImage: ImageView = view.findViewById(R.id.imageView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)

        val itemViewHolder = layoutInflater.inflate(R.layout.cell_layout,parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val anime = myanimeList?.get(position)
        holder.titleTextView.text = anime?.title?: ""
        holder.rankingTextView.text = "MAL ID: "+ anime?.rank?.toString()

        //Load image
        Picasso.get().load(anime?.animeimageURL ?: "")
            .error(R.drawable.image_placeholder)
            .placeholder(R.drawable.image_placeholder)
            .into(holder.animeImage)


    }

    override fun getItemCount(): Int {
        if (myanimeList != null) {
            return myanimeList!!.size
        } else {
            return 0
        }
    }

    fun update() {
        myanimeList = animeViewModel.animeList.value
        notifyDataSetChanged()
    }

}