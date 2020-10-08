<template>
  <AppLayout>

    <div class="max-w-7xl md:mx-auto md:py-2 md:px-6 lg:px-8">
      <h1 class="text-3xl">Categorias</h1>
    </div>
    <div class="align-middle inline-block min-w-full shadow overflow-hidden sm:rounded-lg border-b border-gray-200">
      <table class="min-w-full">
        <thead>
          <tr>
            <th class="px-6 py-3 border-b border-gray-200 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">#</th>
            <th class="px-6 py-3 border-b border-gray-200 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">Nombre</th>
            <th class="px-6 text-left border-b border-gray-200 bg-gray-50 leading-4 text-gray-500 uppercase tracking-wider">
                <inertia-link :href="url_create" class="bg-indigo-700 text-white px-2 py-1 hover:bg-indigo-600 font-bold rounded">
                    <icon name="add_circle"></icon>
                </inertia-link>
            </th>
          </tr>
        </thead>
        <tbody class="bg-white">
          <tr
            v-for="category in categories"
            :key="category.id"
            class="lg:hover:bg-blue-300"
          >
            <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-200">
              {{ category.id }}
            </td>
            <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-200">
              {{ category.name }}
            </td>
            <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-200">
              <inertia-link
                :href="category.url"
                class="bg-green-700 text-white px-2 py-1 hover:bg-green-600 font-bold rounded"
                ><icon name="build"></icon>
              </inertia-link>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </AppLayout>
</template>


<script>
import AppLayout from "../../../Layouts/AppLayout";
import Icon from "vue-md-icons";


export default {
  props: ["categories", "url_create"],
  components: {
    AppLayout,
    Icon,
  },
  created() {
    //console.log(this.categories.data)
  },
};
</script>
