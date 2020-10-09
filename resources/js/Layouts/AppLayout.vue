<template>
  <div class="flex h-screen bg-gray-200">
    <div
      :class="showingNavigationDropdown ? 'block' : 'hidden'"
      @click="showingNavigationDropdown = !showingNavigationDropdown"
      class="fixed z-20 inset-0 bg-black opacity-50 transition-opacity lg:hidden"
    ></div>

        <div
      :class="
        showingNavigationDropdown
          ? 'translate-x-0 ease-out'
          : '-translate-x-full ease-in'
      "
      class="fixed z-30 inset-y-0 left-0 w-64 transition duration-300 transform bg-gray-900 overflow-y-auto lg:translate-x-0 lg:static lg:inset-0"
    >
      <div class="flex items-center justify-center mt-8">
        <div class="flex flex-col items-center" @click="showingNavigationDropdown = true">
            <img class="h-full w-1/3 object-cover rounded-full"  :src="$page.user.profile_photo_url" :alt="$page.user.name"/>

            <span class="text-white text-2xl mt-2 font-semibold">{{$page.user.name}}</span>
        </div>
      </div>

      <nav class="mt-6">
        <nav-link
          href="/dashboard"
          :active="$page.currentRouteName == 'dashboard'"
        >
          <font-awesome-icon icon="tachometer-alt" />
          <span class="mx-3">Dashboard</span>
        </nav-link>

        <nav-link
          href="/dashboard/categories"
          :active="$page.currentRouteName == 'categories.index'"
        >
          <font-awesome-icon icon="bookmark" />

          <span class="mx-3">Categorias</span>
        </nav-link>

        <nav-link :href="$route('logs')" :active="$page.currentRouteName == 'logs'">
          <font-awesome-icon icon="list-alt" />

          <span class="mx-3">Logs</span>
        </nav-link>

        <nav-link
          href="/dashboard/users"
          :active="$page.currentRouteName == 'users.index'"
        >
          <font-awesome-icon icon="users" />

          <span class="mx-3">Usuarios</span>
        </nav-link>
      </nav>
    </div>
    <div class="flex-1 flex flex-col overflow-hidden">
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


      <!-- #End Header -->
      <main class="flex-1 overflow-x-hidden overflow-y-auto bg-gray-200 main">
        <div class="container mx-auto px-1 md:px-6 py-8">
          <main>
            <slot></slot>
            <!-- Modal Portal -->
            <portal-target name="modal" multiple> </portal-target>
          </main>
        </div>
      </main>
    </div>
  </div>
</template>

<script>
import ApplicationLogo from "./../components/ApplicationLogo";
import ApplicationMark from "./../components/ApplicationMark";
import Dropdown from "./../components/Dropdown";
import DropdownLink from "./../components/DropdownLink";
import NavLink from "./../components/NavLink";
import ResponsiveNavLink from "./../components/ResponsiveNavLink";
import Sidebar from "./elements/Sidebar";
import Topbar from "./elements/Topbar";

export default {
  components: {
    ApplicationLogo,
    ApplicationMark,
    Dropdown,
    DropdownLink,
    NavLink,
    ResponsiveNavLink,
    Sidebar,
    Topbar,
  },

  data() {
    return {
      showingNavigationDropdown: false,
      dropdownOpen: false,
    };
  },

  computed: {
    path() {
      return window.location.pathname;
    },
  },
};
</script>
