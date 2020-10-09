<template>
    <div class="bg-white px-4 py-2 flex items-center justify-between border-t border-gray-200 ">
        <div class="flex-1 flex  lg:hidden">
            <inertia-link :href="items.prev_page_url" class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm leading-5 font-medium rounded-md text-gray-700 bg-white hover:text-gray-700 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150" :class="{'bg-gray-300 text-white':items.prev_page_url == null}" disabled>
            Anterior
            </inertia-link>
            <inertia-link :href="items.next_page_url" class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm leading-5 font-medium rounded-md text-gray-700 bg-white hover:text-gray-700 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150">
            Siguiente
            </inertia-link>
        </div>
        <div class="hidden lg:flex-1 lg:flex lg:items-center lg:justify-between">
            <div>
                <p class="text-sm leading-5 text-gray-700">
                    Mostrando del
                    <span class="font-medium">{{items.from}}</span>
                    al
                    <span class="font-medium">{{items.to}}</span>
                    , Total
                    <span class="font-medium">{{items.total}}</span>
                    registros
                </p>
            </div>
            <div>
                <nav class="relative z-0 flex-1  inline-flex shadow-sm">
                    <div  v-for="(link, key) in links" :key="key" >
                        <a v-if="link.url === null"  :href="link.url" class="relative inline-flex items-center px-2 py-2 border border-gray-300 bg-white text-sm leading-5 font-medium text-gray-500 hover:text-gray-400 focus:z-10 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-100 active:text-gray-500 transition ease-in-out duration-1500" :class="{ 'ml-0': link.label === 'Next'}" aria-label="Anterior">
                            {{ linkLabel(link.label) }}
                        </a>
                        <inertia-link v-else :key="key" class="-ml-px relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm leading-5 font-medium   focus:z-10 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150" :class="{ 'bg-white': link.active, 'ml-0': link.label === 'Next', 'bg-indigo-500 text-white': link.active }" :href="link.url">

                            {{ linkLabel(link.label) }}

                        </inertia-link>

                    </div>

                </nav>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        links: Array,
        items: {
            prev_page_url:'#',
            next_page_url:'#'
        },
    },
    methods:{
        linkLabel : (link_label) => {
            if(link_label == 'Next'){
                return "Siguiente";
            }else if(link_label == 'Previous'){
                return "Anterior";
            }

            return link_label;
        }

    },
    created(){
        if(!this.items.prev_page_url){
            this.items.prev_page_url = '#';
        }
        if(!this.items.next_page_url){
            this.items.next_page_url = '#';
        }
    }
}
</script>
