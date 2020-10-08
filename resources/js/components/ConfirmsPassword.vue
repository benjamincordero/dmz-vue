<template>
    <span>
        <span @click="startConfirmingPassword">
            <slot />
        </span>

        <dialog-modal :show="confirmingPassword" @close="confirmingPassword = false">
            <template #title>
                {{ title }}
            </template>

            <template #content>
                {{ content }}

                <div class="mt-4">
                    <Input type="password" class="mt-1 block w-3/4" placeholder="Password"
                                ref="password"
                                v-model="form.password"
                                @keyup.enter.native="confirmPassword" />

                    <input-error :message="form.error" class="mt-2" />
                </div>
            </template>

            <template #footer>
                <secondary-button @click.native="confirmingPassword = false">
                    Nevermind
                </secondary-button>

                <Button class="ml-2" @click.native="confirmPassword" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    {{ button }}
                </Button>
            </template>
        </dialog-modal>
    </span>
</template>

<script>
    import Button from './Button'
    import DialogModal from './DialogModal'
    import Input from './Input'
    import InputError from './InputError'
    import SecondaryButton from './SecondaryButton'

    export default {
        props: {
            title: {
                default: 'Confirm Password',
            },
            content: {
                default: 'For your security, please confirm your password to continue.',
            },
            button: {
                default: 'Confirm',
            }
        },

        components: {
            Button,
            DialogModal,
            Input,
            InputError,
            SecondaryButton,
        },

        data() {
            return {
                confirmingPassword: false,

                form: this.$inertia.form({
                    password: '',
                    error: '',
                }, {
                    bag: 'confirmPassword',
                })
            }
        },

        methods: {
            startConfirmingPassword() {
                this.form.error = '';

                axios.get('/user/confirmed-password-status').then(response => {
                    if (response.data.confirmed) {
                        this.$emit('confirmed');
                    } else {
                        this.confirmingPassword = true;
                        this.form.password = '';

                        setTimeout(() => {
                            this.$refs.password.focus()
                        }, 250)
                    }
                })
            },

            confirmPassword() {
                this.form.processing = true;

                axios.post('/user/confirm-password', {
                    password: this.form.password,
                }).then(response => {
                    this.confirmingPassword = false;
                    this.form.password = '';
                    this.form.error = '';
                    this.form.processing = false;

                    this.$nextTick(() => this.$emit('confirmed'));
                }).catch(error => {
                    this.form.processing = false;
                    this.form.error = error.response.data.errors.password[0];
                });
            }
        }
    }
</script>
