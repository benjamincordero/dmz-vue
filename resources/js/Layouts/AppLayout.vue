<template>
  <div
    x-data="{ showingNavigationDropdown: false }"
    class="flex h-screen bg-gray-200"
  >
    <div
      :class="showingNavigationDropdown ? 'block' : 'hidden'"
      @click="showingNavigationDropdown = false"
      class="fixed z-20 inset-0 bg-black opacity-50 transition-opacity lg:hidden"
    ></div>

    <Sidebar :showingNavigationDropdown="showingNavigationDropdown" />
    <div class="flex-1 flex flex-col overflow-hidden">
      <Topbar
        :showingNavigationDropdown="showingNavigationDropdown"
        :dropdownOpen="dropdownOpen"
      />

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

  methods: {
    logout() {
      axios.post("/logout").then((response) => {
        window.location = "/";
      });
    },
  },

  computed: {
    path() {
      return window.location.pathname;
    },
  },
};
</script>
