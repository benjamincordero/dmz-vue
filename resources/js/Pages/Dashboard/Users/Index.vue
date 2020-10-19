<template>
  <AppLayout>
    <div class="bg-white shadow overflow-hidden sm:rounded-sm">
      <div class="px-4 py-5 border-b border-gray-200 sm:px-6">
        <h3 class="text-lg text-gray-700 font-bold leading-6 font-medium">
          <font-awesome-icon icon="users"></font-awesome-icon>&nbsp;Usuarios
        </h3>
      </div>
      <div class="bg-gray-50 px-4 sm:px-6">
        <div class="flex flex-col">
          <div class="my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="align-middle inline-block min-w-full">
              <div class="shadow overflow-hidden border-gray-200">
                <table class="min-w-full divide-y divide-gray-200">
                  <thead>
                    <tr>
                      <th
                        class="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider"
                      >
                        Usuario
                      </th>
                      <th
                        class="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider"
                      >
                        Status
                      </th>
                      <th
                        class="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider"
                      >
                        Tipo
                      </th>
                      <th class="px-6 py-3 bg-gray-50 text-right">
                        <inertia-link
                          :href="url_create"
                          class="bg-blue-600 hover:bg-blue-700 text-white py-1 px-3 rounded-sm"
                        >
                          <font-awesome-icon icon="plus"></font-awesome-icon>
                        </inertia-link>
                      </th>
                    </tr>
                  </thead>
                  <tbody class="bg-white divide-y divide-gray-200">
                    <tr v-for="user in users.data" :key="user.id">
                      <td class="px-6 py-4 whitespace-no-wrap">
                        <div class="flex items-center">
                          <div class="flex-shrink-0 h-10 w-10">
                            <img
                              class="h-10 w-10 rounded-full"
                              :src="user.profile_photo_url"
                              :alt="user.name"
                            />
                          </div>
                          <div class="ml-4">
                            <div
                              class="text-sm leading-5 font-medium text-gray-900"
                            >
                              {{ user.name }}
                            </div>
                            <div class="text-sm leading-5 text-gray-500">
                              {{ user.email }}
                            </div>
                          </div>
                        </div>
                      </td>
                      <td class="px-6 py-4 whitespace-no-wrap">
                        <div
                          class="relative inline-block w-10 mr-2 align-middle select-none transition duration-200 ease-in"
                        >
                          <input
                            type="checkbox"
                            name="status"
                            :id="`toggle${user.id}`"
                            class="toggle-checkbox absolute block w-6 h-6 rounded-full bg-white border-4 appearance-none cursor-pointer"
                            value=""
                            :checked="user.status"
                            @change="statusToogle($event, user.id)"
                          />
                          <label
                            :for="`toggle${user.id}`"
                            class="toggle-label block overflow-hidden h-6 rounded-full bg-gray-300 cursor-pointer"
                          ></label>
                        </div>
                      </td>
                      <td
                        class="px-6 py-4 whitespace-no-wrap text-sm leading-5 text-gray-500"
                      >
                        {{ user.role == "user" ? "Normal" : "Admin" }}
                      </td>
                      <td
                        class="px-6 py-4 whitespace-no-wrap text-right text-sm leading-5 font-medium"
                      >
                        <inertia-link
                          :href="$route('users.edit', user.id)"
                          class="bg-green-400 hover:bg-green-500 text-white py-1 px-3 rounded-sm"
                        >
                          <font-awesome-icon icon="pen"></font-awesome-icon>
                        </inertia-link>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      <pagination :links="users.links" :items="users"></pagination>
    </div>
  </AppLayout>
</template>

<script>
import AppLayout from "../../../Layouts/AppLayout";
import Pagination from "../../../components/Pagination";
export default {
  props: ["users", "url_create"],
  components: {
    AppLayout,
    Pagination,
  },
  data() {
    return {
      status_form: this.$inertia.form({
        status: false,
      }),
    };
  },

  methods: {
    async statusToogle(el, id) {
      this.status_form.status = el.target.checked;
      try {
        this.$inertia.put(route("users.change_status", id), this.status_form);
      } catch (e) {
        console.log(e);
      }
    },
  },
};
</script>
<style>
.toggle-checkbox:checked {
  @apply: right-0 border-green-400;
  right: 0;
  border-color: #68d391;
}
.toggle-checkbox:checked + .toggle-label {
  @apply: bg-green-400;
  background-color: #68d391;
}
</style>
