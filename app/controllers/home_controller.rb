class HomeController < ApplicationController
  def index
    @explore_tiles = [
      { title: "Hosting", image: "hosting.jpg", description: "Create and manage swaps that bring people together. With automations and automations, your next swap will be a breeze." },
      { title: "Participating", image: "participating.jpg", description: "Join fun, creative swaps and track your progress! Plus you can keep your swaps organized when all your swaps are hosted here!" },
      { title: "Moderating", image: "moderating.jpg", description: "Sometimes, you need help hosting a swap! Moderators can help guide groups, assign partners, and manage timelines." },
      { title: "Community", image: "community.jpg", description: "Stay connected with others in your swap group and see everyone updates in one easy feed! No more need to search the hashtags and hope you see them all." }
    ]
  end
end
