<template>
  <app-layout>
    <template #header>
      <h2 class="text-xl font-semibold leading-tight text-gray-800">
        Dashboard
      </h2>
    </template>

    <div class="py-2">
      <div class="mx-auto max-w-7xl sm:px-4 lg:px-2">
        <div class="overflow-hidden">
          <div
            class="text-center grid grid-flow-rows md:grid-cols-3 gap-4"
          >
            <inertia-link
              :href="$route('ofrendas.index')"
              class="w-full p-4 bg-white rounded-md"
            >
              <img
                src="assets/images/logos/ofrendas.svg"
                alt="diezmos"
                class="w-40 mx-auto"
              />
              <h1 class="mt-4 text-xl font-bold text-blue-500">Ofrendas</h1>
            </inertia-link>
            <inertia-link
              :href="$route('transferencias.index')"
              class="w-full p-4 bg-white rounded-md"
            >
              <img
                src="assets/images/logos/transferencias.svg"
                alt="diezmos"
                class="w-40 mx-auto"
              />
              <h1 class="mt-4 text-xl font-bold text-blue-500">
                Transferencias
              </h1>
            </inertia-link>
           <inertia-link
              :href="$route('diezmos.index')"
              class="w-full p-4 bg-white rounded-md"
            >
              <img
                src="assets/images/logos/diezmos.svg"
                alt="diezmos"
                class="w-40 mx-auto"
              />
              <h1 class="mt-4 text-xl font-bold text-blue-500">Diezmos</h1>
            </inertia-link>
          </div>
        </div>
      </div>
    </div>
  </app-layout>
</template>

<script>
import AppLayout from "./../Layouts/AppLayout";

export default {
  components: {
    AppLayout,
  },
};
</script>
