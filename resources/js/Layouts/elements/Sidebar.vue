<template>
    <div
      :class="
        showingNavigationDropdown
          ? 'translate-x-0 ease-out'
          : '-translate-x-full ease-in'
      "
      class="fixed z-30 inset-y-0 left-0 w-64 transition duration-300 transform bg-gray-900 overflow-y-auto lg:translate-x-0 lg:static lg:inset-0"
    >
      <div class="flex items-center justify-center mt-8">
        <div class="flex items-center" @click="showingNavigationDropdown = true">
            <img class="h-full w-full object-cover" :src="$page.user.profile_photo_url" :alt="$page.user.name"/>

          <span class="text-white text-2xl mx-2 font-semibold">Dashboard</span>
        </div>
      </div>

      <nav class="mt-10">
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
</template>

<script>
import NavLink from "../../components/NavLink";

export default {
    props:['showingNavigationDropdown'],
    components:{
        NavLink,
    },
    data() {
        return {
            dropdownOpen: false,
        };
    },
};
</script>
