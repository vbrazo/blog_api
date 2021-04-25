defmodule BlogApi.Factory do
  use ExMachina.Ecto, repo: BlogApi.Repo

  def user_factory do
    %BlogApi.Accounts.User{
      email: Faker.Internet.email(),
      username: Faker.Internet.user_name(),
      password: "some password",
      bio: Faker.Lorem.sentence(),
      image: Faker.Avatar.image_url()
    }
  end

  def article_factory do
    %BlogApi.Blog.Article{
      body: Faker.Lorem.sentence(),
      description: Faker.Lorem.sentence(),
      title: Faker.Lorem.sentence(),
      tag_list: ["tag1", "tag2"],
      slug: sequence(:slug, &"some-tile-#{&1}"),
      author: build(:user)
    }
  end

  def comment_factory do
    %BlogApi.Blog.Comment{
      body: Faker.Lorem.sentence(),
      author: build(:user)
    }
  end

  def favorite_factory do
    %BlogApi.Blog.Favorite{
      user: build(:user),
      article: build(:article)
    }
  end
end
