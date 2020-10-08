<template>
    <div>
        <button :class="classes" class="w-full text-left" v-if="as == 'button'">
            <slot></slot>
        </button>

        <inertia-link :href="href" :class="classes" v-else>
            <slot></slot>
        </inertia-link>
    </div>
</template>

<script>
    export default {
        props: ['active', 'href', 'as'],

        computed: {
            classes() {
                return this.active
                            ? 'block pl-3 pr-4 py-2 border-l-4 border-indigo-600 text-base font-medium text-indigo-700 bg-indigo-50 focus:outline-none focus:text-white focus:bg-gray-700 focus:border-indigo-700 transition duration-150 ease-in-out hover:bg-indigo-800 hover:text-white'
                            : 'block pl-3 pr-4 py-2 border-l-4 border-transparent text-base font-medium text-gray-600 hover:text-white hover:bg-indigo-600 hover:border-indigo-900 focus:outline-none focus:text-white focus:bg-gray-700 focus:border-indigo-800 transition duration-150 ease-in-out'
            }
        }
    }
</script>
