<template>
    <header
      class="flex justify-between items-center py-4 px-6 bg-white border-b-2 border-gray-400"
    >
      <div class="flex items-center">
        <button
          @click="showingNavigationDropdown = true"
          class="text-gray-500 focus:outline-none lg:hidden"
        >
          <svg
            class="h-6 w-6"
            viewBox="0 0 24 24"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M4 6H20M4 12H20M4 18H11"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            ></path>
          </svg>
        </button>
      </div>

      <div class="flex items-center">
        <div class="relative">
          <button
            @click="dropdownOpen = !dropdownOpen"
            class="relative block h-8 w-8 rounded-full overflow-hidden shadow focus:outline-none"
          >
            <img
              class="h-full w-full object-cover"
              :src="$page.user.profile_photo_url"
              :alt="$page.user.name"
            />
          </button>

          <div
            v-show="dropdownOpen"
            @click="dropdownOpen = false"
            class="fixed inset-0 h-full w-full z-10"
            style="display: none"
          ></div>

          <div
            v-show="dropdownOpen"
            class="absolute right-0 mt-2 w-48 bg-white rounded-md overflow-hidden shadow-xl z-10"
            style="display: none"
          >
            <responsive-nav-link
              href="/user/profile"
              :active="$page.currentRouteName == 'profile.show'"
            >
              Profile
            </responsive-nav-link>

            <responsive-nav-link
              href="/user/api-tokens"
              :active="$page.currentRouteName == 'api-tokens.index'"
              v-if="$page.jetstream.hasApiFeatures"
            >
              API Tokens
            </responsive-nav-link>

            <!-- Authentication -->
            <form method="POST" @submit.prevent="logout">
              <responsive-nav-link as="button"> Salir </responsive-nav-link>
            </form>
          </div>
        </div>
      </div>
    </header>

</template>

<script>
import ResponsiveNavLink from "../../components/ResponsiveNavLink";

export default {
  components: {
      ResponsiveNavLink

  },
    data() {
        return {
        showingNavigationDropdown: false,
        dropdownOpen: false,
        };
    },
  methods: {
    logout() {
      axios.post("/logout").then((response) => {
        window.location = "/";
      });
    },
  },
};
</script>
