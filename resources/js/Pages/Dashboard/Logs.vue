<template>
  <AppLayout>
    <div class="bg-white shadow overflow-hidden sm:rounded-lg">
      <div class="flex px-4 py-5 border-b border-gray-200 sm:px-6">
        <h3 class="text-lg leading-6 font-medium text-gray-600 w-1/2">
          <font-awesome-icon icon="list-alt"></font-awesome-icon>&nbsp;Logs
        </h3>
        <div class="w-1/2">
            <form @submit.prevent="search">
                <div class="pt-2 relative mx-auto text-gray-600">
                    <input v-model="search_state" class="border-2 w-full border-gray-300 bg-white h-10 px-5 pr-16 rounded-lg text-sm focus:outline-none"
                    type="search" name="search" placeholder="Buscar..." ref="search">

                    <button type="submit" class="absolute right-0 top-0 mt-5 mr-4">
                        <font-awesome-icon icon="search" class="text-gray-600 h-4 w-4 fill-current"></font-awesome-icon>
                    </button>
                </div>
            </form>
        </div>
      </div>
      <div class="bg-gray-50 px-4 sm:px-6">

        <div class="flex flex-col">
          <div class="my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="align-middle inline-block min-w-full">
              <div class="shadow overflow-hidden border-gray-200">
                <table class="min-w-full divide-y divide-gray-200">
                  <thead>
                    <tr>
                      <th class="px-6 font-bold py-2 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">
                        Usuario
                      </th>
                      <th class="px-6 font-bold py-2 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">
                        Ruta
                      </th>
                    </tr>
                  </thead>
                  <tbody class="bg-white divide-y divide-gray-200">
                    <tr v-for="log in logs.data" :key="log.id">
                      <td class="px-6 py-4 whitespace-no-wrap">
                        <div class="flex items-center">
                          {{ log.user.name }}
                        </div>
                      </td>

                      <td class="px-6 py-4 whitespace-no-wrap text-sm leading-5 text-gray-500">
                        {{ log.action }}
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
                <pagination :links="logs.links" :items="logs"></pagination>

            </div>
          </div>
        </div>
      </div>
    </div>
  </AppLayout>
</template>

<script>
import AppLayout from "../../Layouts/AppLayout";
import Pagination from "../../components/Pagination";

export default {
    props: ["logs", "search_text"],
    components: {
        AppLayout,
        Pagination,
    },
    data(){
        return {
            search_state: this.search_text
        }
    },
    methods:{
        search(){
            this.$inertia.visit(route("logs")+'?search='+this.search_state);
        },
        focusSearch(){
            setTimeout(() => {
                this.$refs.search.focus();
            });
        }
    },
    created(){
        if(this.search_state){
            this.focusSearch();
        }
    }



};
</script>
