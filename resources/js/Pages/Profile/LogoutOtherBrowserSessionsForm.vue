<template>
    <action-section>
        <template #title>
            Sesiones del navegador
        </template>

        <template #description>
            Administre y cierre la sesión de sus sesiones activas en otros navegadores y dispositivos.
        </template>

        <template #content>
            <div class="max-w-xl text-sm text-gray-600">
                Si es necesario, puede cerrar la sesión de todas las demás sesiones de su navegador en todos sus dispositivos. Si cree que su cuenta se ha visto comprometida, también debe actualizar su contraseña.
            </div>

            <!-- Other Browser Sessions -->
            <div class="mt-5 space-y-6" v-if="sessions.length > 0">
                <div class="flex items-center" v-for="session in sessions" :key="session.id">
                    <div>
                        <svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor" class="w-8 h-8 text-gray-500" v-if="session.agent.is_desktop">
                            <path d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                        </svg>

                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round" class="w-8 h-8 text-gray-500" v-else>
                            <path d="M0 0h24v24H0z" stroke="none"></path><rect x="7" y="4" width="10" height="16" rx="1"></rect><path d="M11 5h2M12 17v.01"></path>
                        </svg>
                    </div>

                    <div class="ml-3">
                        <div class="text-sm text-gray-600">
                            {{ session.agent.platform }} - {{ session.agent.browser }}
                        </div>

                        <div>
                            <div class="text-xs text-gray-500">
                                {{ session.ip_address }},

                                <span class="text-green-500 font-semibold" v-if="session.is_current_device">This device</span>
                                <span v-else>Last active {{ session.last_active }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="flex items-center mt-5">
                <Button @click.native="confirmLogout" class="inline-flex items-center px-4 py-2 bg-gray-800 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray transition ease-in-out duration-150">
                    Cerrar sesión en otras sesiones del navegador
                </Button>

                <action-message :on="form.recentlySuccessful" class="ml-3">
                    Done.
                </action-message>
            </div>

            <!-- Logout Other Devices Confirmation Modal -->
            <dialog-modal :show="confirmingLogout" @close="confirmingLogout = false">
                <template #title>
                    Cerrar sesión en otras sesiones del navegador
                </template>

                <template #content>
                    Ingrese su contraseña para confirmar que desea cerrar la sesión de sus otras sesiones de navegador en todos sus dispositivos.

                    <div class="mt-4 flex justify-around">
                        <Input type="password" class="mt-1 block w-3/4" placeholder="Password"
                                    ref="password"
                                    v-model="form.password"
                                    @keyup.enter.native="logoutOtherBrowserSessions" />

                        <input-error :message="form.error('password')" class="mt-2" />
                    </div>
                </template>

                <template #footer>
                    <secondary-button @click.native="confirmingLogout = false">
                        Cancelar
                    </secondary-button>

                    <Button class="ml-2" @click.native="logoutOtherBrowserSessions" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                        Cerrar sesión en otras sesiones del navegador
                    </Button>
                </template>
            </dialog-modal>
        </template>
    </action-section>
</template>

<script>
    import ActionMessage from './../../components/ActionMessage'
    import ActionSection from './../../components/ActionSection'
    import Button from './../../components/Button'
    import DialogModal from './../../components/DialogModal'
    import Input from './../../components/Input'
    import InputError from './../../components/InputError'
    import SecondaryButton from './../../components/SecondaryButton'

    export default {
        props: ['sessions'],

        components: {
            ActionMessage,
            ActionSection,
            Button,
            DialogModal,
            Input,
            InputError,
            SecondaryButton,
        },

        data() {
            return {
                confirmingLogout: false,

                form: this.$inertia.form({
                    '_method': 'DELETE',
                    password: '',
                }, {
                    bag: 'logoutOtherBrowserSessions'
                })
            }
        },

        methods: {
            confirmLogout() {
                this.form.password = ''
                this.confirmingLogout = true

                setTimeout(() => {
                    this.$refs.password.focus()
                }, 250)
            },

            logoutOtherBrowserSessions() {
                this.form.post('/user/other-browser-sessions', {
                    preserveScroll: true
                }).then(response => {
                    if (! this.form.hasErrors()) {
                        this.confirmingLogout = false
                    }
                })
            },
        },
    }
</script>
